var RouteHandler = ReactRouter.RouteHandler,
    Link = ReactRouter.Link;

var App = React.createClass({
  render: function() {
    return (
      <div>
        <nav>
          <ul>
            <li>
              <Link to='/'>Hello World</Link>
            </li>
            <li>
              <Link to='/page1'>Another Page</Link>
            </li>
          </ul>
        </nav>
        <RouteHandler {...this.props}/>
      </div>
    );
  }
});
