Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799523E2740;
	Tue,  4 Aug 2026 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848145; cv=none; b=m7AB5ib4TPE/9ya/ZFT5RaJ9/ymZebz7/xswNAw+fAQWQbkqaivh3CLY65aciE6ellrbhegg4a3uy64Lt/9KdTyOUI2pCeFf46RME3/pP77Yf4Q7dbw61nkfCrjblHRUd7RKbg3aprWLq5IvBZTpX6xh59fmYV2+TAtbsyNesY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848145; c=relaxed/simple;
	bh=U0XNCwgE529iAqicn2/HvYaG7j0IrWjWmVyu6ke2pv8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eZz0XAY6z7zOD25caBzdc2ATf8lL9m8YRLkPNJDCsSmT2uTVo4jfUDJm5/2uSftAahI1smMDm3aXOLnFZOiIDTljP35McQHjm6UQst7YWT0Y+Mvo0McmuplgbSrZWkI/NbVnaFtk2Sp0U2DV8z99G0Sq08NxaNNn5MTZRj/0UPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iF2oBTHk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iF2oBTHk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3741E1F000E9;
	Tue,  4 Aug 2026 12:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785848140;
	bh=9JyJ9i6QvV2lZd8/uKxsmu1fM0BkijsD1S531bWDnCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iF2oBTHk4DcwdEmikw2VWz3UaS75dAR+E+s4RSCqi/E7o9TO8gZzvh+KKfQJlpRPP
	 ODQktB4fAota8L8HgZ7uvya/rVSgULu/xRlAqyk8QHEIhT58vfUsqsfWMogjnlFJSn
	 44Yv3/mSEVMsAXXlZW4pIvV+pDEOud2IDm23sidGZV0RptNv8xDd/qp5xogbPnmOA6
	 97fyLEH3fn7DQT2XcoqYv82x4i0cmH1+Oy4LFWCdrE+W/t9wALpFw9xZah+jET8fR+
	 cA391CSHZNz1EQx8KSFjQqf++aKpHqmcq9TGYoBr7UVutshB2IoiYeUgHSK67bYHfc
	 wIz5T+/YUwqSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] thermal/drivers/loongson2: Move thermal_ops to
 chip_data for SoC scalability
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <7fe74a58c164da2e7a897598142f28df0e5ef0c4.1785829933.git.zhoubinbin@loongson.cn>
References: <cover.1785829933.git.zhoubinbin@loongson.cn>
 <7fe74a58c164da2e7a897598142f28df0e5ef0c4.1785829933.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:55:39 +0000
Message-Id: <20260804125540.3741E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver misuses the `clamp()` macro when setting temperature th=
resholds, failing to bound the requested trip values to the hardware's supp=
orted range `[-40, 125]`.
--

--- Patch [2]: [PATCH v4 2/5] thermal/drivers/loongson2: Move thermal_ops t=
o chip_data for SoC scalability ---
commit 1f38b1d9f1db90805ef5765872a4c9de0db11e9c
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Move thermal_ops to chip_data for SoC scalability
   =20
In preparation for supporting additional Loongson SoCs, this commit
relocates the thermal zone device operations pointer from the probe
routine to the per-SoC chip_data structure. This eliminates the need to
add conditional branches in probe() when a new SoC is introduced.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index 5f47fa51fb907..1a8ca2cd06f1b 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
[ ... ]
> @@ -160,7 +156,7 @@ static int loongson2_thermal_probe(struct platform_de=
vice *pdev)
>  	loongson2_thermal_set(data, 0, 0, false);
> =20

[Severity: High]
This is a pre-existing issue, but does loongson2_thermal_set() misuse the
clamp macro when setting temperature thresholds?

Looking at drivers/thermal/loongson2_thermal.c:loongson2_thermal_set(), the
arguments to clamp() appear to be in the wrong order:

	/* Set low temperature threshold */
	loongson2_set_ctrl_regs(data, clamp(-40, low, high), true, enable);

	/* Set high temperature threshold */
	loongson2_set_ctrl_regs(data, clamp(125, low, high), false, enable);

Because the clamp macro arguments are swapped (using clamp(-40, low, high)
instead of clamp(low, -40, 125) and clamp(high, -40, 125)), values like a
high trip point > 155C are not bounded to 125.

If root sets a thermal trip point > 155C via sysfs, adding HECTO (100) to
156+ results in a value > 255.

When this is written to the 16-bit hardware register, can it overflow into
bit 8 (the enable bit), overwriting the control state and truncating the
threshold to an incorrect value?

Could this cause immediate and continuous hardware thermal alarms (IRQ
storm), rendering the system unusable?

>  	for (i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
> -		tzd =3D devm_thermal_of_zone_register(dev, i, data, thermal_ops);
> +		tzd =3D devm_thermal_of_zone_register(dev, i, data, data->chip_data->t=
hermal_ops);
>  		if (!IS_ERR(tzd))
>  			break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785829933.gi=
t.zhoubinbin@loongson.cn?part=3D2
