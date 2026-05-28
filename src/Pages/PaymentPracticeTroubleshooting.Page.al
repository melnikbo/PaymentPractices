// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.Analysis;

page 691 "Payment Practice Troubleshooting"
{
    ApplicationArea = All;
    Caption = 'Payment Practice Troubleshooting';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Checks)
            {
                Caption = 'Checks';
                InstructionalText = 'Verify payment periods exist, open the payment practice card, use View Source Entries to inspect underlying data, and regenerate if header type or dates changed.';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenSetupOverview)
            {
                ApplicationArea = All;
                Caption = 'Setup Overview';
                Image = Setup;
                ToolTip = 'Opens the payment practice setup overview.';
                RunObject = page "Payment Practice Setup Overview";
            }
            action(OpenPaymentPeriods)
            {
                ApplicationArea = All;
                Caption = 'Payment Periods';
                Image = Calendar;
                ToolTip = 'Opens payment periods used to bucket actual payment days.';
                RunObject = page "Payment Periods";
            }
            action(OpenPaymentPracticeList)
            {
                ApplicationArea = All;
                Caption = 'Payment Practices';
                Image = List;
                ToolTip = 'Opens the list of generated payment practices.';
                RunObject = page "Payment Practice List";
            }
        }
    }
}
