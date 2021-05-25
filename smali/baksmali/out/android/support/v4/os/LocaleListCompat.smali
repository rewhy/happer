.class public final Landroid/support/v4/os/LocaleListCompat;
.super Ljava/lang/Object;
.source "LocaleListCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/os/LocaleListCompat$LocaleListCompatApi24Impl;,
        Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;
    }
.end annotation


# static fields
.field static final IMPL:Landroid/support/v4/os/LocaleListInterface;

.field private static final sEmptyLocaleList:Landroid/support/v4/os/LocaleListCompat;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Landroid/support/v4/os/LocaleListCompat;

    invoke-direct {v0}, Landroid/support/v4/os/LocaleListCompat;-><init>()V

    sput-object v0, Landroid/support/v4/os/LocaleListCompat;->sEmptyLocaleList:Landroid/support/v4/os/LocaleListCompat;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_15

    new-instance v0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatApi24Impl;

    invoke-direct {v0}, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatApi24Impl;-><init>()V

    sput-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    goto :goto_1c

    :cond_15
    new-instance v0, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;

    invoke-direct {v0}, Landroid/support/v4/os/LocaleListCompat$LocaleListCompatBaseImpl;-><init>()V

    sput-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    :goto_1c
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs create([Ljava/util/Locale;)Landroid/support/v4/os/LocaleListCompat;
    .registers 2
    .param p0    # [Ljava/util/Locale;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/support/v4/os/LocaleListCompat;

    invoke-direct {v0}, Landroid/support/v4/os/LocaleListCompat;-><init>()V

    invoke-direct {v0, p0}, Landroid/support/v4/os/LocaleListCompat;->setLocaleListArray([Ljava/util/Locale;)V

    return-object v0
.end method

.method public static forLanguageTags(Ljava/lang/String;)Landroid/support/v4/os/LocaleListCompat;
    .registers 5
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    if-eqz p0, :cond_38

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_38

    :cond_9
    const-string v0, ","

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    new-array v0, v0, [Ljava/util/Locale;

    const/4 v1, 0x0

    :goto_14
    array-length v2, v0

    if-ge v1, v2, :cond_2f

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_24

    aget-object v2, p0, v1

    invoke-static {v2}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v2

    goto :goto_2a

    :cond_24
    aget-object v2, p0, v1

    invoke-static {v2}, Landroid/support/v4/os/LocaleHelper;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v2

    :goto_2a
    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_2f
    new-instance p0, Landroid/support/v4/os/LocaleListCompat;

    invoke-direct {p0}, Landroid/support/v4/os/LocaleListCompat;-><init>()V

    invoke-direct {p0, v0}, Landroid/support/v4/os/LocaleListCompat;->setLocaleListArray([Ljava/util/Locale;)V

    return-object p0

    :cond_38
    :goto_38
    invoke-static {}, Landroid/support/v4/os/LocaleListCompat;->getEmptyLocaleList()Landroid/support/v4/os/LocaleListCompat;

    move-result-object p0

    return-object p0
.end method

.method public static getAdjustedDefault()Landroid/support/v4/os/LocaleListCompat;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation build Landroid/support/annotation/Size;
        min = 0x1L
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_f

    invoke-static {}, Landroid/os/LocaleList;->getAdjustedDefault()Landroid/os/LocaleList;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/os/LocaleListCompat;->wrap(Ljava/lang/Object;)Landroid/support/v4/os/LocaleListCompat;

    move-result-object v0

    return-object v0

    :cond_f
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/util/Locale;

    const/4 v1, 0x0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Landroid/support/v4/os/LocaleListCompat;->create([Ljava/util/Locale;)Landroid/support/v4/os/LocaleListCompat;

    move-result-object v0

    return-object v0
.end method

.method public static getDefault()Landroid/support/v4/os/LocaleListCompat;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation build Landroid/support/annotation/Size;
        min = 0x1L
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_f

    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/os/LocaleListCompat;->wrap(Ljava/lang/Object;)Landroid/support/v4/os/LocaleListCompat;

    move-result-object v0

    return-object v0

    :cond_f
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/util/Locale;

    const/4 v1, 0x0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Landroid/support/v4/os/LocaleListCompat;->create([Ljava/util/Locale;)Landroid/support/v4/os/LocaleListCompat;

    move-result-object v0

    return-object v0
.end method

.method public static getEmptyLocaleList()Landroid/support/v4/os/LocaleListCompat;
    .registers 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->sEmptyLocaleList:Landroid/support/v4/os/LocaleListCompat;

    return-object v0
.end method

.method private setLocaleList(Landroid/os/LocaleList;)V
    .registers 6
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x18
    .end annotation

    invoke-virtual {p1}, Landroid/os/LocaleList;->size()I

    move-result v0

    if-lez v0, :cond_19

    new-array v1, v0, [Ljava/util/Locale;

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v0, :cond_14

    invoke-virtual {p1, v2}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_14
    sget-object p1, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {p1, v1}, Landroid/support/v4/os/LocaleListInterface;->setLocaleList([Ljava/util/Locale;)V

    :cond_19
    return-void
.end method

.method private varargs setLocaleListArray([Ljava/util/Locale;)V
    .registers 3

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0, p1}, Landroid/support/v4/os/LocaleListInterface;->setLocaleList([Ljava/util/Locale;)V

    return-void
.end method

.method public static wrap(Ljava/lang/Object;)Landroid/support/v4/os/LocaleListCompat;
    .registers 3
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x18
    .end annotation

    new-instance v0, Landroid/support/v4/os/LocaleListCompat;

    invoke-direct {v0}, Landroid/support/v4/os/LocaleListCompat;-><init>()V

    instance-of v1, p0, Landroid/os/LocaleList;

    if-eqz v1, :cond_e

    check-cast p0, Landroid/os/LocaleList;

    invoke-direct {v0, p0}, Landroid/support/v4/os/LocaleListCompat;->setLocaleList(Landroid/os/LocaleList;)V

    :cond_e
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0, p1}, Landroid/support/v4/os/LocaleListInterface;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public get(I)Ljava/util/Locale;
    .registers 3

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0, p1}, Landroid/support/v4/os/LocaleListInterface;->get(I)Ljava/util/Locale;

    move-result-object p1

    return-object p1
.end method

.method public getFirstMatch([Ljava/lang/String;)Ljava/util/Locale;
    .registers 3

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0, p1}, Landroid/support/v4/os/LocaleListInterface;->getFirstMatch([Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p1

    return-object p1
.end method

.method public hashCode()I
    .registers 2

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0}, Landroid/support/v4/os/LocaleListInterface;->hashCode()I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/util/Locale;)I
    .registers 3
    .annotation build Landroid/support/annotation/IntRange;
        from = -0x1L
    .end annotation

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0, p1}, Landroid/support/v4/os/LocaleListInterface;->indexOf(Ljava/util/Locale;)I

    move-result p1

    return p1
.end method

.method public isEmpty()Z
    .registers 2

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0}, Landroid/support/v4/os/LocaleListInterface;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public size()I
    .registers 2
    .annotation build Landroid/support/annotation/IntRange;
        from = 0x0L
    .end annotation

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0}, Landroid/support/v4/os/LocaleListInterface;->size()I

    move-result v0

    return v0
.end method

.method public toLanguageTags()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0}, Landroid/support/v4/os/LocaleListInterface;->toLanguageTags()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0}, Landroid/support/v4/os/LocaleListInterface;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unwrap()Ljava/lang/Object;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    sget-object v0, Landroid/support/v4/os/LocaleListCompat;->IMPL:Landroid/support/v4/os/LocaleListInterface;

    invoke-interface {v0}, Landroid/support/v4/os/LocaleListInterface;->getLocaleList()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
