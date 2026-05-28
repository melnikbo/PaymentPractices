// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.Analysis;

permissionset 688 "Paym. Prac. Troubleshoot"
{
    Access = Public;
    Assignable = true;

    Permissions =
        tabledata "Payment Period" = R,
        tabledata "Payment Practice Data" = R,
        tabledata "Payment Practice Line" = R,
        tabledata "Payment Practice Header" = R,
        page "Payment Periods" = X,
        page "Payment Practice Card" = X,
        page "Payment Practice Data List" = X,
        page "Payment Practice Lines" = X,
        page "Payment Practice List" = X,
        page "Payment Practice Setup Overview" = X,
        page "Payment Practice Troubleshooting" = X,
        report "Payment Practice" = X;
}
