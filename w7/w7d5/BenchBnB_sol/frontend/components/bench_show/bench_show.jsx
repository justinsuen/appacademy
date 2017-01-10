import React from 'react';
import { Link } from 'react-router';

import BenchDetail from './bench_detail';
import BenchMap from '../bench_map/bench_map';
import ReviewButton from './review_button';

const BenchShow = ({ bench, benchId, fetchBench, children }) => {
  const benches = {
    [benchId]: bench
  };

  return(
    <div className="single-bench-show">
      <div className="single-bench-map">
        <Link to="/">Back to Benches Index</Link>
        <BenchMap
          benches={benches}
          benchId={benchId}
          singleBench={true}
          fetchBench={fetchBench}
          />
      </div>
      <div className="right-half bench-details">
        <BenchDetail bench={bench} />
        {children || <ReviewButton benchId={benchId} />}
      </div>
    </div>
  );
};

export default BenchShow;
