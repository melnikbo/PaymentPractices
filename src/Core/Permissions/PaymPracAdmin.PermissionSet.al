// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.Analysis;

permissionset 689 "Paym. Prac. Admin"
{
    Access = Public;
    Assignable = true;
    IncludedPermissionSets = "Paym. Prac. Edit";

    Permissions =
        page "Payment Practice Line Overview" = X,
        page "Payment Practice Troubleshooting" = X;
}
