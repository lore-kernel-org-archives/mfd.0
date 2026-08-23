Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D999D2F693B
	for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 15:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787497487; cv=none; b=oWmST/0GrFXTU0fhyVmrRSFwtBpzgL+IARJ0yk1LjJMvgyAiJIScgPgCsFu4FZh6k8uCkGPJTbQ8o//R0tEAoPvIr8hcCQWwqMCA1tjigNj33bcjZOjqtLLjEPNdn8QV8Cua6TbhpYfyinvgmWJ3mI1+WAkZ0hSvZoIbm85IuWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787497487; c=relaxed/simple;
	bh=wJK+IRMBLE0VnTn8bSkgSg1Z4ePe8NtBDxX5MSaJXlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmVLJon4f7x/nyomg2BglTuBPnWIFzaj1hTz6gUvtLK1L7/pilUvWFrUNUT2WxP5m/4Dct4dX/2VCLQTufvFf0jJtyTHmb6a6/IUnAZSEooYt7twGLPy+tHWxuy8WFtm82K3Ihv1muIUh+uSEcIlj7z0MfR1LgZzxHQU4VKIcuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a99xvnwq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a99xvnwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D5C1F00A3D
	for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787497485;
	bh=xsGgYkAkQbDGRSbjrvJuqtTe00nXz5WswQtw/Srcifs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=a99xvnwq+UjFxWXZ32BNHv9W84m1gmsn2FUsYDLIIzkVNeIGjOFDzYd59m5c/gpD7
	 LNsKUL87b0uNtvqwul5jgUWO+N0RcGSzlXlYzG3mCO02vlhyeHZBSedUHxThMu2v03
	 VILIpzCX75hMNtkd53DlQnENzia7/CZ/fAH1DQk4uQBaPe03K+kTbHo/nSYv39n8Hr
	 Za2CFFIlgLwjBZMjLb/XIF8CDDVOwEojYcYBCoo8/bVqLiz4cBd1ZYPyaYsrmCv/cw
	 +P1tvvS56QUXERtCatenyaKSOSyZVxiHzOzKX37Opi1hz7XXyhuGhWcM0y1IE//XH4
	 i/XVY56tnlFbA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so25138571fa.3
        for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 08:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqVzO0McAiL2TDqJ/e1xsI3efTPfUFcatdtGmFP6FkdLWYeAbVt/ct2W6K+yni5AFuCpyM=@lists.linux.dev
X-Gm-Message-State: AFuF++mAgRZs8IgQi3s6R/ZTHqOJtAW4co+fLvCCBqaHEKfzgC5FJAZQ
	wrxFYc/ZdpmFuBTU4+JynLJz8/eIH50aNzLnUlU08wZZT/GO8f4krBt9WsEM/SgNtIIdaDgqfO7
	vptf3Md5kdE9ra6lnilk9CGBPo/IgXts=
X-Received: by 2002:a2e:bc28:0:b0:3a1:11d3:173e with SMTP id
 38308e7fff4ca-3a1aee83d62mr48188841fa.14.1787497483973; Sun, 23 Aug 2026
 08:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com> <20260812-axp318-regulator-v6-5-d6b84b55c000@baylibre.com>
In-Reply-To: <20260812-axp318-regulator-v6-5-d6b84b55c000@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 23 Aug 2026 23:04:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v64HtVFWmYV5uYBN+h2S+xGM=0XrkHuRj13cG3W=nOVN1Q@mail.gmail.com>
X-Gm-Features: AcwNN1VquLs742qEc8_LGCpKYFHLYLrK5XTQoYktTpdadWoCANLMlSKPCtF7-Qk
Message-ID: <CAGb2v64HtVFWmYV5uYBN+h2S+xGM=0XrkHuRj13cG3W=nOVN1Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v6 5/5] regulator: axp20x: add support for the AXP318W
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
> The X-Powers AXP318W is a typical PMIC from X-Powers, featuring nine
> DC/DC converters and 28 LDOs, on the regulator side.
>
> Describe the chip's voltage settings and switch registers, how the
> voltages are encoded, and connect this to the MFD device via its
> regulator ID.
> We use just "318" for the internal identifiers, for easier typing and
> less churn. If something else other than the "AXP318W" shows up, that's
> an easy change, externally visible strings carry the additional letter
> already.
>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Co-developed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/regulator/axp20x-regulator.c | 324 +++++++++++++++++++++++++++++=
+++++-
>  include/linux/mfd/axp20x.h           |  45 +++++
>  2 files changed, 360 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index da891415efc0..9e81e2cb7542 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -138,6 +138,29 @@
>  #define AXP313A_DCDC_V_OUT_MASK                GENMASK(6, 0)
>  #define AXP313A_LDO_V_OUT_MASK         GENMASK(4, 0)
>
> +#define AXP318_DCDC1_PFM_PWM_CTRL      BIT(7)
> +#define AXP318_DCDC23_POLYPHASE_CTRL   BIT(6)
> +#define AXP318_DCDC45_POLYPHASE_CTRL   BIT(7)
> +#define AXP318_DCDC1_V_OUT_MASK                GENMASK(4, 0)
> +#define AXP318_DCDC2_V_OUT_MASK                GENMASK(6, 0)
> +#define AXP318_LDO_V_OUT_MASK          GENMASK(4, 0)
> +#define AXP318_ELDO_V_OUT_MASK         GENMASK(5, 0)
> +#define AXP318_THRESHOLD_VOLTAGE       1540000
> +/*
> + * FIXME:
> + * Some LDOs of the AXP318 may be fed by different supplies and
> + * the documentation repeatedly warns that output voltage must
> + * be less than the supply, which is the case for any LDO really.
> + *
> + * The best way to let the framework handle this is to set the
> + * min_dropout_uV field. However the AXP318 documentation
> + * does not provide any information about this.
> + *
> + * Realistically, it can't be less than 1uV so use this
> + * for all LDOs until we know more.
> + */
> +#define AXP318_LDO_MIN_DROPOUT         1 /* uV */
> +
>  #define AXP717_DCDC1_NUM_VOLTAGES      88
>  #define AXP717_DCDC2_NUM_VOLTAGES      107
>  #define AXP717_DCDC3_NUM_VOLTAGES      103

[...]

> @@ -1430,6 +1704,20 @@ static int axp20x_set_dcdc_workmode(struct regulat=
or_dev *rdev, int id, u32 work
>                 workmode <<=3D ffs(mask) - 1;
>                 break;
>
> +       case AXP318_ID:
> +               /*
> +                * Only DCDC1 has PWM control on the AXP318
> +                * The other DCDCs control DVM through bit 7 of the relat=
ed
> +                * registers. Work mode could possibly extended to deal w=
ith
> +                * this but it is not how it is documented at the moment
> +                */

DVM bit is for turning on / off voltage ramp rate control. It is unrelated
to work mode. Please drop the comment.

> +               if (id !=3D AXP318_DCDC1)
> +                       return -EINVAL;
> +               reg =3D AXP318_DCDC1_CONTROL;
> +               mask =3D AXP318_DCDC1_PFM_PWM_CTRL;
> +               workmode <<=3D ffs(mask) - 1;
> +               break;
> +
>         case AXP806_ID:
>                 /*
>                  * AXP806 DCDC regulator IDs have the same range as AXP22=
X.

[...]

> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index 0191467de4ec..251f057ea76d 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -128,6 +128,7 @@ enum axp20x_variants {
>  #define AXP318_DCDC7_CONTROL           0x18
>  #define AXP318_DCDC8_CONTROL           0x19
>  #define AXP318_DCDC9_CONTROL           0x1a
> +#define AXP318_DCDC_CONTROL1           0x1b

This could be moved to the previous patch for completeness.

[...]


Once fixed,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
