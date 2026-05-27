// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.Analysis;

using System.Telemetry;

page 689 "Payment Practice List"
{
    ApplicationArea = All;
    Caption = 'Payment Practices';
    CardPageId = "Payment Practice Card";
    Editable = false;
    PageType = List;
    SourceTable = "Payment Practice Header";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the payment practice document.';

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Payment Practice Card", Rec);
                    end;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the starting date of the payment practice report.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the ending date of the payment practice report.';
                }

            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(SetupOverview)
            {
                ApplicationArea = All;
                Caption = 'Setup Overview';
                Image = Setup;
                ToolTip = 'Opens the setup overview with links to payment periods and payment practices.';
                RunObject = page "Payment Practice Setup Overview";
            }
            action(OpenPaymentPeriods)
            {
                ApplicationArea = All;
                Caption = 'Payment Periods';
                Image = Calendar;
                ToolTip = 'Opens payment periods that define day ranges for payment practice aggregation.';
                RunObject = page "Payment Periods";
            }
        }
    }

    trigger OnOpenPage()
    var
        FeatureTelemetry: Codeunit "Feature Telemetry";
    begin
        FeatureTelemetry.LogUptake('0000KSW', 'Payment Practices', "Feature Uptake Status"::Discovered);
    end;
}
