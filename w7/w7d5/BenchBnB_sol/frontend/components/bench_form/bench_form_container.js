import { connect } from 'react-redux';
import { createBench } from '../../actions/bench_actions';
import BenchForm from './bench_form';

const mapStateToProps = (state, { location }) => ({
  lat: location.query.lat,
  lng: location.query.lng
});

const mapDispatchToProps = dispatch => ({
  createBench: bench => dispatch(createBench(bench))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(BenchForm);
