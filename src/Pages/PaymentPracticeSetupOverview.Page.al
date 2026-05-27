// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.Analysis;

page 690 "Payment Practice Setup Overview"
{
    ApplicationArea = All;
    Caption = 'Payment Practice Setup Overview';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Setup)
            {
                Caption = 'Setup steps';
                InstructionalText = 'Define payment day ranges on Payment Periods, then generate and review payment practices from the list.';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenPaymentPeriods)
            {
                ApplicationArea = All;
                Caption = 'Payment Periods';
                Image = Calendar;
                ToolTip = 'Opens payment periods that bucket actual payment days for aggregation.';
                RunObject = page "Payment Periods";
            }
            action(OpenPaymentPracticeList)
            {
                ApplicationArea = All;
                Caption = 'Payment Practices';
                Image = List;
                ToolTip = 'Opens generated payment practices for review and drill-down.';
                RunObject = page "Payment Practice List";
            }
        }
    }
}
