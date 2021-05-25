.class public final Landroid/support/v4/accessibilityservice/AccessibilityServiceInfoCompat;
.super Ljava/lang/Object;
.source "AccessibilityServiceInfoCompat.java"


# static fields
.field public static final CAPABILITY_CAN_FILTER_KEY_EVENTS:I = 0x8

.field public static final CAPABILITY_CAN_REQUEST_ENHANCED_WEB_ACCESSIBILITY:I = 0x4

.field public static final CAPABILITY_CAN_REQUEST_TOUCH_EXPLORATION:I = 0x2

.field public static final CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT:I = 0x1

.field public static final FEEDBACK_ALL_MASK:I = -0x1

.field public static final FEEDBACK_BRAILLE:I = 0x20

.field public static final FLAG_INCLUDE_NOT_IMPORTANT_VIEWS:I = 0x2

.field public static final FLAG_REPORT_VIEW_IDS:I = 0x10

.field public static final FLAG_REQUEST_ENHANCED_WEB_ACCESSIBILITY:I = 0x8

.field public static final FLAG_REQUEST_FILTER_KEY_EVENTS:I = 0x20

.field public static final FLAG_REQUEST_TOUCH_EXPLORATION_MODE:I = 0x4


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static capabilityToString(I)Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const/4 v0, 0x4

    if-eq p0, v0, :cond_16

    const/16 v0, 0x8

    if-eq p0, v0, :cond_13

    packed-switch p0, :pswitch_data_1a

    const-string p0, "UNKNOWN"

    return-object p0

    :pswitch_d
    const-string p0, "CAPABILITY_CAN_REQUEST_TOUCH_EXPLORATION"

    return-object p0

    :pswitch_10
    const-string p0, "CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT"

    return-object p0

    :cond_13
    const-string p0, "CAPABILITY_CAN_FILTER_KEY_EVENTS"

    return-object p0

    :cond_16
    const-string p0, "CAPABILITY_CAN_REQUEST_ENHANCED_WEB_ACCESSIBILITY"

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_10
        :pswitch_d
    .end packed-switch
.end method

.method public static feedbackTypeToString(I)Ljava/lang/String;
    .registers 5
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_a
    if-lez p0, :cond_4e

    invoke-static {p0}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v1

    const/4 v2, 0x1

    shl-int v1, v2, v1

    xor-int/lit8 v3, v1, -0x1

    and-int/2addr p0, v3

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-le v3, v2, :cond_21

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_21
    const/4 v2, 0x4

    if-eq v1, v2, :cond_48

    const/16 v2, 0x8

    if-eq v1, v2, :cond_42

    const/16 v2, 0x10

    if-eq v1, v2, :cond_3c

    packed-switch v1, :pswitch_data_58

    goto :goto_a

    :pswitch_30
    const-string v1, "FEEDBACK_HAPTIC"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    :pswitch_36
    const-string v1, "FEEDBACK_SPOKEN"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    :cond_3c
    const-string v1, "FEEDBACK_GENERIC"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    :cond_42
    const-string v1, "FEEDBACK_VISUAL"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    :cond_48
    const-string v1, "FEEDBACK_AUDIBLE"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    :cond_4e
    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_58
    .packed-switch 0x1
        :pswitch_36
        :pswitch_30
    .end packed-switch
.end method

.method public static flagToString(I)Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x4

    if-eq p0, v0, :cond_23

    const/16 v0, 0x8

    if-eq p0, v0, :cond_20

    const/16 v0, 0x10

    if-eq p0, v0, :cond_1d

    const/16 v0, 0x20

    if-eq p0, v0, :cond_1a

    packed-switch p0, :pswitch_data_26

    const/4 p0, 0x0

    return-object p0

    :pswitch_14
    const-string p0, "FLAG_INCLUDE_NOT_IMPORTANT_VIEWS"

    return-object p0

    :pswitch_17
    const-string p0, "DEFAULT"

    return-object p0

    :cond_1a
    const-string p0, "FLAG_REQUEST_FILTER_KEY_EVENTS"

    return-object p0

    :cond_1d
    const-string p0, "FLAG_REPORT_VIEW_IDS"

    return-object p0

    :cond_20
    const-string p0, "FLAG_REQUEST_ENHANCED_WEB_ACCESSIBILITY"

    return-object p0

    :cond_23
    const-string p0, "FLAG_REQUEST_TOUCH_EXPLORATION_MODE"

    return-object p0

    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_17
        :pswitch_14
    .end packed-switch
.end method

.method public static getCapabilities(Landroid/accessibilityservice/AccessibilityServiceInfo;)I
    .registers 3
    .param p0    # Landroid/accessibilityservice/AccessibilityServiceInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityServiceInfo;->getCapabilities()I

    move-result p0

    return p0

    :cond_b
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityServiceInfo;->getCanRetrieveWindowContent()Z

    move-result p0

    if-eqz p0, :cond_13

    const/4 p0, 0x1

    return p0

    :cond_13
    const/4 p0, 0x0

    return p0
.end method

.method public static loadDescription(Landroid/accessibilityservice/AccessibilityServiceInfo;Landroid/content/pm/PackageManager;)Ljava/lang/String;
    .registers 4
    .param p0    # Landroid/accessibilityservice/AccessibilityServiceInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/content/pm/PackageManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    invoke-virtual {p0, p1}, Landroid/accessibilityservice/AccessibilityServiceInfo;->loadDescription(Landroid/content/pm/PackageManager;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    invoke-virtual {p0}, Landroid/accessibilityservice/AccessibilityServiceInfo;->getDescription()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
