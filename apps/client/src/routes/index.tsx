import * as React from 'react';
import { createBrowserRouter, Outlet } from 'react-router-dom';

import { PATHS } from '~/consts';

const AppRoute = React.lazy(() => import('~/routes/app'));

export const router = createBrowserRouter([
  {
    element: (
      <>
        <Outlet />
      </>
    ),
    children: [
      {
        path: PATHS.HOME,
        element: (
          <React.Suspense fallback={<>lazy ...</>}>
            <AppRoute />
          </React.Suspense>
        ),
      },
    ],
  },
]);
