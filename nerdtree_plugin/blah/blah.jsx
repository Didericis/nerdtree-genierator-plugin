import React, { Component } from 'react';
import PropTypes from 'prop-types';

import styles from './blah.css';

export default class Blah extends Component {
  static propTypes = {
    className: PropTypes.string,
  }

  className = () => {
    const classNames = [styles.main];
    const { className } = this.props;
    if (className) className.push(className);
    return classNames.join(' ');
  }

  render() {
    return (
      <div className={this.className()}>
        <h1>Blah</h1>
      </div>
    );
  }
}
