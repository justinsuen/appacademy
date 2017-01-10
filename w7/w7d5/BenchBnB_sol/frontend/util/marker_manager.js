/* global google:false */

export default class MarkerManager {
  constructor(map, handleClick){
    this.map = map;
    this.handleClick = handleClick;
    this.markers = [];
    //permanently bind instance methods
    this._createMarkerFromBench = this._createMarkerFromBench.bind(this);
    this._removeMarker = this._removeMarker.bind(this);
    this._markersToRemove = this._markersToRemove.bind(this);
  }

  updateMarkers(benches){
    this.benches = benches;
    this._benchesToAdd().forEach(this._createMarkerFromBench);
    this._markersToRemove().forEach(this._removeMarker);
  }

  _benchesToAdd() {
    const currentBenches = this.markers.map( marker => marker.benchId );
    return this.benches.filter( bench => !currentBenches.includes(bench.id) );
  }

  _markersToRemove(){
    const benchIds = this.benches.map( bench => bench.id );
    return this.markers.filter( marker => !benchIds.includes(marker.benchId) );
  }

  _createMarkerFromBench(bench) {
    const pos = new google.maps.LatLng(bench.lat, bench.lng);
    const marker = new google.maps.Marker({
      position: pos,
      map: this.map,
      benchId: bench.id
    });
    marker.addListener('click', () => this.handleClick(bench));
    this.markers.push(marker);
  }

  _removeMarker(marker) {
    const idx = this.markers.indexOf( marker );
    this.markers[idx].setMap(null);
    this.markers.splice(idx, 1);
  }
}
