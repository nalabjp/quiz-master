var QuizForm = React.createClass({
  getInitialState() {
    return {
      answerValue: "",
      disabledValue: false
    };
  },

  changeAnswerText(e) {
    this.setState({answerValue: e.target.value});
  },

  handleSubmit: function(e) {
    e.preventDefault();
    this.setState({disabledValue: true});

    var answer = this.refs.question_answer.value.trim();
    if (!answer) {
      Materialize.toast('Please input your answer!', 4000);
      this.setState(this.getInitialState());
      return;
    }

    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'PATCH',
      data: { 'question': { 'answer': answer } },
      success: function(data) {
        Materialize.toast(data.message, 4000);
        if (data.result != 'correct') {
          this.setState(this.getInitialState());
        }
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });

    return;
  },

  render: function() {
    return(
      <div>
        <h4>{this.props.content}</h4>
        <form id="quiz" className="quiz" onSubmit={this.handleSubmit} acceptCharset="UTF-8">
          <input name="utf8" type="hidden" value="✓" />
          <input type="hidden" name="_method" value="patch" />
          <div className="input-field">
            <input value={this.state.answerValue} onChange={this.changeAnswerText} className="validate" type="text" name="question[answer]" ref="question_answer" />
            <label htmlFor="question_answer">Answer</label>
          </div>
          <div className="row">
            <div className="col s6 input-field">
              <div className="right">
                <input type="submit" name="commit" value="Submit" className="btn z-depth-3" ref="submit" disabled={this.state.disabledValue} />
              </div>
            </div>
            <div className="col s6 input-field">
              <a className="btn z-depth-3" href="/">Back</a>
            </div>
          </div>
        </form>
      </div>
    );
  }
});
