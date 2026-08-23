Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F551990C7
	for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787491075; cv=none; b=eMIT44V4Yq5OmRh1719V8vAKLFD9WW0l0EZeIl0ri5Vvi3d2xHBT66umvTJgJ0nsJl8fWtCnk4e3r45NVlu1VtVlPLBmjwAwvX/f7RChceaxC6N6ynPOnC5MlSN6HzKt4fzK2Gi+sBFkabihD0RcjFKC/kY7vxgrPYnMfvpNKlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787491075; c=relaxed/simple;
	bh=CYTLeT7Z/Naj8p9HlS63yVRbaRyuzGOrQiGPiDTQ2ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f03Sd1tfLHfp1HrKymrAeZQIAykLnL2hyQgHN74fzDgiJ5wbY84c6N04rsMw/a4fMdwknt9EO8HGTRDAKxk4GrIY6WrG1cKnIbH/31KwUIpOZGCTblswa+jcwB3Edqc/L/kITlg0iLonKV4J++sS0TnR0d0OCYqA9wPRnKwKLqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD8WMRa+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KD8WMRa+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2991F000E9
	for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787491074;
	bh=2cxTWBPqywkJGDBoUm2j3fncZ0luhC2dj1cnwdhN0qU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KD8WMRa+9Qs896cGziyK+hxTbUFujsDm8pnyGWL2vSkzsGHzNuTApReDnhswUaMQB
	 EZB0kutVGQTN51wD9sOLEvh88hJ6c1YmX+xNyJmgbvQSYH6PTRdZB936gxaZsJktrc
	 FZxtlqVk0exFNvxICQ0tRQOkeqUpHFNZE6e0ErMXz2Vv14mHfsdjJrKUxDBDayx1Ne
	 HIdxjf6r6ozrkeEsGI7Xn3Pf0azvnKkgIZeaNBa6/8RzhrHWM5IehQdzLGsjDqrgDQ
	 hRLEjGs+E70PDTdkIHcQsMAERrcqywSqXt1U5ixABf9v6keOjH4gQB4MeLEWl4vh9R
	 QNnixdBtaL12g==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39ca300db70so22138651fa.2
        for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 06:17:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrXK8TXEJgNKzzRZHZFnBQEsPP4dxB1m+fFMB24D6WDoiFc9lj+M00a2zTWzhrLeRxpGtk=@lists.linux.dev
X-Gm-Message-State: AFuF++kp1i1mggHY+x5mmThNNcjXb1eBimOZzVREh707Sng5v2IsOzFh
	BP0frgRJj7FNU+A1sqYSUZHP/AWhN1C7Uc7TE7/vR1rYAi9GY5nT7wHR6scVWYd6ZW3FssjtRM+
	4CnGr7xJ0A6vu62RnnVTp0mLlgy1ErMs=
X-Received: by 2002:a2e:a587:0:b0:399:6c9e:dfaa with SMTP id
 38308e7fff4ca-3a1c1dde554mr22856181fa.2.1787491072312; Sun, 23 Aug 2026
 06:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com> <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
In-Reply-To: <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 23 Aug 2026 21:17:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Uz6hCQaf5Nk5Eup8wQ+Xo9tuAqm0+ZH9J5CbT0zyAPg@mail.gmail.com>
X-Gm-Features: AcwNN1WyeWi-qvoFmgQ2l97eJ8l4oauH6PsI2TweouP6wFixCDaLgHG6yAzwOGw
Message-ID: <CAGb2v66Uz6hCQaf5Nk5Eup8wQ+Xo9tuAqm0+ZH9J5CbT0zyAPg@mail.gmail.com>
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 5:31=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> From: Andre Przywara <andre.przywara@arm.com>
>
> The AXP318W is a PMIC chip produced by X-Powers, it can be connected to
> an I2C bus.
>
> It has a large number of regulators: 9(!) DCDC buck converters, and 28
> LDOs, also some ADCs, interrupts, and a power key.
>
> Describe the regmap and the MFD bits, along with the registers exposed
> via I2C only. This covers the regulators and interrupts for now.
> Advertise the device using the new compatible string.
>
> We use just "318" for the internal identifiers, for easier typing and
> less churn, but use "318W" for anything externally visible. If something
> else other than the "AXP318W" shows up, that's an easy change then.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/mfd/axp20x-i2c.c   |  2 ++
>  drivers/mfd/axp20x.c       | 81 ++++++++++++++++++++++++++++++++++++++++=
++
>  include/linux/mfd/axp20x.h | 88 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 171 insertions(+)

[...]

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 84839d4aa1ca..ea00c0cdce58 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -218,6 +219,31 @@ static const struct regmap_access_table axp313a_vola=
tile_table =3D {
>         .n_yes_ranges =3D ARRAY_SIZE(axp313a_volatile_ranges),
>  };
>
> +static const struct regmap_range axp318_writeable_ranges[] =3D {

  +       regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_DATACACHE(3)),

> +       regmap_reg_range(AXP318_DCDC_OUTPUT_CONTROL1, AXP318_IRQ_STATE4),

Probably want to skip the holes between:

- AXP318_DCDC9_CONTROL and AXP318_DCDC_MODE_CTRL1
- AXP318_DCDC_MODE_CTRL1 and AXP318_DCDC_MODE_CTRL3
- AXP318_DCDC_MODE_CTRL3 and AXP318_LDO_OUTPUT_CONTROL1
- AXP318_IRQ_EN4 and AXP318_IRQ_STATE1

> +       regmap_reg_range(AXP318_SHUTDOWN_SRC_CTRL1, AXP318_TEMP_ADC_H_EN)=
,

Holes between

- AXP318_POK_CTRL and AXP318_TEMP_ADC_H_EN
- AXP318_WAKEUP_PWROK_PIN_CFG and AXP318_TS_PIN_CFG
- AXP318_TS_PIN_CFG and AXP318_TEMP_ADC_H_EN

> +       regmap_reg_range(AXP318_DIE_TEMP_ADC_H_EN, AXP318_DIE_TEMP_ADC_H_=
EN),
> +       regmap_reg_range(AXP318_GPADC_H_EN, AXP318_GPADC_H_EN),
> +       regmap_reg_range(AXP318_GPIO_CTRL, AXP318_WDOG_CTRL),
> +};
> +
> +static const struct regmap_range axp318_volatile_ranges[] =3D {
> +       regmap_reg_range(AXP318_IRQ_EN1, AXP318_IRQ_STATE4),

The EN bits aren't volatile; only the status bits are.

> +       regmap_reg_range(AXP318_POWER_REASON, AXP318_SHUTDOWN_SOURCE),
> +       regmap_reg_range(AXP318_TEMP_ADC_H_EN, AXP318_GPADC_L),
> +       regmap_reg_range(AXP318_GPIO_INPUT, AXP318_GPIO_INPUT),
> +};
> +
> +static const struct regmap_access_table axp318_writeable_table =3D {
> +       .yes_ranges =3D axp318_writeable_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(axp318_writeable_ranges),
> +};
> +
> +static const struct regmap_access_table axp318_volatile_table =3D {
> +       .yes_ranges =3D axp318_volatile_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(axp318_volatile_ranges),
> +};
> +
>  static const struct regmap_range axp717_writeable_ranges[] =3D {
>         regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
>         regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
> @@ -447,6 +473,15 @@ static const struct regmap_config axp313a_regmap_con=
fig =3D {
>         .cache_type =3D REGCACHE_MAPLE,
>  };
>
> +static const struct regmap_config axp318_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .wr_table =3D &axp318_writeable_table,
> +       .volatile_table =3D &axp318_volatile_table,
> +       .max_register =3D AXP318_WDOG_CTRL,
> +       .cache_type =3D REGCACHE_MAPLE,
> +};
> +
>  static const struct regmap_config axp323_regmap_config =3D {
>         .reg_bits =3D 8,
>         .val_bits =3D 8,
> @@ -663,6 +698,28 @@ static const struct regmap_irq axp313a_regmap_irqs[]=
 =3D {
>         INIT_REGMAP_IRQ(AXP313A, DIE_TEMP_HIGH,         0, 0),
>  };
>
> +static const struct regmap_irq axp318_regmap_irqs[] =3D {
> +       INIT_REGMAP_IRQ(AXP318, DCDC8_V_LOW,            0, 7),
> +       INIT_REGMAP_IRQ(AXP318, DCDC7_V_LOW,            0, 6),
> +       INIT_REGMAP_IRQ(AXP318, DCDC6_V_LOW,            0, 5),
> +       INIT_REGMAP_IRQ(AXP318, DCDC5_V_LOW,            0, 4),
> +       INIT_REGMAP_IRQ(AXP318, DCDC4_V_LOW,            0, 3),
> +       INIT_REGMAP_IRQ(AXP318, DCDC3_V_LOW,            0, 2),
> +       INIT_REGMAP_IRQ(AXP318, DCDC2_V_LOW,            0, 1),
> +       INIT_REGMAP_IRQ(AXP318, DCDC1_V_LOW,            0, 0),
> +       INIT_REGMAP_IRQ(AXP318, PEK_RIS_EDGE,           1, 6),
> +       INIT_REGMAP_IRQ(AXP318, PEK_FAL_EDGE,           1, 5),

> +       INIT_REGMAP_IRQ(AXP318, PEK_LONG,               1, 4),
> +       INIT_REGMAP_IRQ(AXP318, PEK_SHORT,              1, 3),

These two seem to be reversed.

> +       INIT_REGMAP_IRQ(AXP318, DIE_TEMP_HIGH_LV2,      1, 2),
> +       INIT_REGMAP_IRQ(AXP318, DIE_TEMP_HIGH_LV1,      1, 1),
> +       INIT_REGMAP_IRQ(AXP318, DCDC9_V_LOW,            1, 0),
> +       INIT_REGMAP_IRQ(AXP318, GPIO3_INPUT,            2, 6),
> +       INIT_REGMAP_IRQ(AXP318, GPIO2_INPUT,            2, 5),
> +       INIT_REGMAP_IRQ(AXP318, GPIO1_INPUT,            2, 4),
> +       INIT_REGMAP_IRQ(AXP318, WDOG_EXPIRE,            3, 0),
> +};
> +
>  static const struct regmap_irq axp717_regmap_irqs[] =3D {
>         INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL2,          0, 7),
>         INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL1,          0, 6),
> @@ -884,6 +941,17 @@ static const struct regmap_irq_chip axp313a_regmap_i=
rq_chip =3D {
>         .num_regs               =3D 1,
>  };
>
> +static const struct regmap_irq_chip axp318_regmap_irq_chip =3D {
> +       .name                   =3D "axp318w_irq_chip",
> +       .status_base            =3D AXP318_IRQ_STATE1,
> +       .ack_base               =3D AXP318_IRQ_STATE1,
> +       .unmask_base            =3D AXP318_IRQ_EN1,
> +       .init_ack_masked        =3D true,
> +       .irqs                   =3D axp318_regmap_irqs,
> +       .num_irqs               =3D ARRAY_SIZE(axp318_regmap_irqs),
> +       .num_regs               =3D 4,
> +};
> +
>  static const struct regmap_irq_chip axp717_regmap_irq_chip =3D {
>         .name                   =3D "axp717_irq_chip",
>         .status_base            =3D AXP717_IRQ0_STATE,
> @@ -1061,6 +1129,10 @@ static const struct mfd_cell axp313a_cells[] =3D {
>         MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
>
> +static const struct mfd_cell axp318_cells[] =3D {
> +       MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),

Unless this PMIC is used as a sub-PMIC in other designs, we don't need an I=
D.
Allwinner designs "mostly" only have one PMIC. We add IDs only when needed,
as seen on the AXP313a and AXP806 + AXP809.

> +};
> +
>  static const struct mfd_cell axp717_cells[] =3D {
>         MFD_CELL_NAME("axp20x-regulator"),
>         MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
> @@ -1248,6 +1320,9 @@ static int axp20x_power_off(struct sys_off_data *da=
ta)
>         case AXP313A_ID:
>                 shutdown_reg =3D AXP313A_SHUTDOWN_CTRL;
>                 break;
> +       case AXP318_ID:
> +               shutdown_reg =3D AXP318_SHUTDOWN_CTRL;
> +               break;
>         default:
>                 shutdown_reg =3D AXP20X_OFF_CTRL;
>                 break;
> @@ -1312,6 +1387,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>                 axp20x->regmap_cfg =3D &axp313a_regmap_config;
>                 axp20x->regmap_irq_chip =3D &axp313a_regmap_irq_chip;
>                 break;
> +       case AXP318_ID:
> +               axp20x->nr_cells =3D ARRAY_SIZE(axp318_cells);
> +               axp20x->cells =3D axp318_cells;
> +               axp20x->regmap_cfg =3D &axp318_regmap_config;
> +               axp20x->regmap_irq_chip =3D &axp318_regmap_irq_chip;
> +               break;
>         case AXP323_ID:
>                 axp20x->nr_cells =3D ARRAY_SIZE(axp313a_cells);
>                 axp20x->cells =3D axp313a_cells;
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index 1badb4868d17..0191467de4ec 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -19,6 +19,7 @@ enum axp20x_variants {
>         AXP223_ID,
>         AXP288_ID,
>         AXP313A_ID,
> +       AXP318_ID,
>         AXP323_ID,
>         AXP717_ID,
>         AXP803_ID,
> @@ -116,6 +117,71 @@ enum axp20x_variants {
>  #define AXP313A_IRQ_STATE              0x21
>  #define AXP323_DCDC_MODE_CTRL2         0x22
>
> +#define AXP318_DCDC_OUTPUT_CONTROL1    0x10
> +#define AXP318_DCDC_OUTPUT_CONTROL2    0x11
> +#define AXP318_DCDC1_CONTROL           0x12
> +#define AXP318_DCDC2_CONTROL           0x13
> +#define AXP318_DCDC3_CONTROL           0x14
> +#define AXP318_DCDC4_CONTROL           0x15
> +#define AXP318_DCDC5_CONTROL           0x16
> +#define AXP318_DCDC6_CONTROL           0x17
> +#define AXP318_DCDC7_CONTROL           0x18
> +#define AXP318_DCDC8_CONTROL           0x19
> +#define AXP318_DCDC9_CONTROL           0x1a

+#define AXP318_DCDC_MODE_CTRL1           0x1b
+#define AXP318_DCDC_MODE_CTRL3           0x1d

> +#define AXP318_LDO_OUTPUT_CONTROL1     0x20
> +#define AXP318_LDO_OUTPUT_CONTROL2     0x21
> +#define AXP318_LDO_OUTPUT_CONTROL3     0x22
> +#define AXP318_LDO_OUTPUT_CONTROL4     0x23
> +#define AXP318_ALDO1_CONTROL           0x24
> +#define AXP318_ALDO2_CONTROL           0x25
> +#define AXP318_ALDO3_CONTROL           0x26
> +#define AXP318_ALDO4_CONTROL           0x27
> +#define AXP318_ALDO5_CONTROL           0x28
> +#define AXP318_ALDO6_CONTROL           0x29
> +#define AXP318_BLDO1_CONTROL           0x2a
> +#define AXP318_BLDO2_CONTROL           0x2b
> +#define AXP318_BLDO3_CONTROL           0x2c
> +#define AXP318_BLDO4_CONTROL           0x2d
> +#define AXP318_BLDO5_CONTROL           0x2e
> +#define AXP318_CLDO1_CONTROL           0x2f
> +#define AXP318_CLDO2_CONTROL           0x30
> +#define AXP318_CLDO3_CONTROL           0x31
> +#define AXP318_CLDO4_CONTROL           0x32
> +#define AXP318_CLDO5_CONTROL           0x33
> +#define AXP318_DLDO1_CONTROL           0x34
> +#define AXP318_DLDO2_CONTROL           0x35
> +#define AXP318_DLDO3_CONTROL           0x36
> +#define AXP318_DLDO4_CONTROL           0x37
> +#define AXP318_DLDO5_CONTROL           0x38
> +#define AXP318_DLDO6_CONTROL           0x39
> +#define AXP318_ELDO1_CONTROL           0x3a
> +#define AXP318_ELDO2_CONTROL           0x3b
> +#define AXP318_ELDO3_CONTROL           0x3c
> +#define AXP318_ELDO4_CONTROL           0x3d
> +#define AXP318_ELDO5_CONTROL           0x3e
> +#define AXP318_ELDO6_CONTROL           0x3f
> +#define AXP318_IRQ_EN1                 0x40
> +#define AXP318_IRQ_EN2                 0x41
> +#define AXP318_IRQ_EN3                 0x42
> +#define AXP318_IRQ_EN4                 0x43
> +#define AXP318_IRQ_STATE1              0x48
> +#define AXP318_IRQ_STATE2              0x49
> +#define AXP318_IRQ_STATE3              0x4a
> +#define AXP318_IRQ_STATE4              0x4b
> +#define AXP318_POWER_REASON            0x50
> +#define AXP318_SHUTDOWN_SOURCE         0x51
> +#define AXP318_SHUTDOWN_SRC_CTRL1      0x52
> +#define AXP318_SHUTDOWN_SRC_CTRL2      0x53

  +#define AXP318_DISCHARGE_OVERTEMP_CTRL 0x54

> +#define AXP318_SHUTDOWN_CTRL           0x55

  +#define AXP318_WAKEUP_VOFF_CTRL        0x56
  +#define AXP318_POK_CTRL                0x57

  +#define AXP318_WAKEUP_PWROK_PIN_CFG    0x5d

  +#define AXP318_TS_PIN_CFG              0x60

> +#define AXP318_TEMP_ADC_H_EN           0x65
> +#define AXP318_TEMP_ADC_L              0x66
> +#define AXP318_DIE_TEMP_ADC_H_EN       0x67
  +#define AXP318_DIE_TEMP_ADC_L          0x68
> +#define AXP318_GPADC_H_EN              0x69
> +#define AXP318_GPADC_L                 0x6a
> +#define AXP318_GPIO_CTRL               0x70
> +#define AXP318_GPIO_INPUT              0x71

  +#define AXP318_GPIO_OUTPUT             0x72
  +#define AXP318_PWM_CTRL1               0x73
  +#define AXP318_PWM_CTRL2               0x74
  +#define AXP318_PWM_CTRL3               0x75
  +#define AXP318_BACKUP_BATTERY_CTRL     0x76

> +#define AXP318_WDOG_CTRL               0x77
> +
>  #define AXP717_ON_INDICATE             0x00
>  #define AXP717_PMU_STATUS_2            0x01
>  #define AXP717_BC_DETECT               0x05
> @@ -819,6 +885,28 @@ enum axp313a_irqs {
>         AXP313A_IRQ_PEK_RIS_EDGE,
>  };
>
> +enum axp318_irqs {
> +       AXP318_IRQ_DCDC1_V_LOW,
> +       AXP318_IRQ_DCDC2_V_LOW,
> +       AXP318_IRQ_DCDC3_V_LOW,
> +       AXP318_IRQ_DCDC4_V_LOW,
> +       AXP318_IRQ_DCDC5_V_LOW,
> +       AXP318_IRQ_DCDC6_V_LOW,
> +       AXP318_IRQ_DCDC7_V_LOW,
> +       AXP318_IRQ_DCDC8_V_LOW,
> +       AXP318_IRQ_DCDC9_V_LOW,
> +       AXP318_IRQ_DIE_TEMP_HIGH_LV1,
> +       AXP318_IRQ_DIE_TEMP_HIGH_LV2,

> +       AXP318_IRQ_PEK_SHORT,
> +       AXP318_IRQ_PEK_LONG,

The order of these two are reversed.

> +       AXP318_IRQ_PEK_FAL_EDGE,
> +       AXP318_IRQ_PEK_RIS_EDGE,

And these two as well.

Once all these are fixed,
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


ChenYu

> +       AXP318_IRQ_GPIO1_INPUT =3D 20,
> +       AXP318_IRQ_GPIO2_INPUT,
> +       AXP318_IRQ_GPIO3_INPUT,
> +       AXP318_IRQ_WDOG_EXPIRE =3D 24,
> +};
> +
>  enum axp717_irqs {
>         AXP717_IRQ_VBUS_FAULT,
>         AXP717_IRQ_VBUS_OVER_V,
>
> --
> 2.47.3
>
