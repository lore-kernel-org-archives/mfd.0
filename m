Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497693DA7D4;
	Fri, 31 Jul 2026 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491835; cv=none; b=doR9KEzc3nsaWso8kZj04DhWPYsulWwNjncEjLv+FQ5zO95xz1SLAdcIhRosbzC/5kkhhAxpYp466bsBPGVmfh/vxNBs6dxiQshP/l+2liSr0OiDgjyp8KTVAewbzJUOKbNvKjfV+I9YNDDXtSkD1ypciohyytijUfoERFJKjyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491835; c=relaxed/simple;
	bh=KIiTMsdQmfP+2TWdGD1PrwmpE4nvAnwGsbfzgamyYPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PQ9IJ0BuBKrtbk1V2ePX90AdHwhJYVHqZfhjaeZteElzTeXgHMBXeUk0PmyuJvDBrgTA0GnP7Ksk3xK8yuJ555u4yd71IRS0SjOJuYo34uzZ1nCJZzr4XNCMzxaokMJK1cCqbEMU1cn/KDrkETA1qXGFLj+7N1GYoiMp9pbIIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GuNpB39d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GuNpB39d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2771F000E9;
	Fri, 31 Jul 2026 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491821;
	bh=WivR7iJEHJ9l/OVbLNALYgsFd9a51WZOQLpMWpX5fXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GuNpB39dll+MEgDBc+D9wle9XbT2t7+nkMd1UEOApC669lVJ6mbkcElMN3JwAVr0h
	 NqUiRkOF0HrA9B75J0Ldjdes/0hqn9qYPi0FnxBoj1M11DefjE/ZWYc+WMfju0Sxly
	 XefIqWnkf4x5dGlh6M4CKa0INDO5/G27wATqekiMphrb7BZRXYjiADy79ho1g9Xwiz
	 zYMRqTKXZiumIAAnqBfNomCrj7R7OT6trUa3q+o6IMImH+us/fffg4IOt3YeVXTSDs
	 1TKoJN3SKx9rt+Zn0BaSLRtm4zuMcKlOXYD95NNWuw5MQUE6qxD0KJZ4fetFBEZud8
	 Lbq+bd+IfgUjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: thermal: loongson,ls2k-thermal: Add
 compatible for Loongson-2K0300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <5c6f32c841d34a9f370b5a0981a71cb23bc6e62a.1785480242.git.zhoubinbin@loongson.cn>
References: <cover.1785480242.git.zhoubinbin@loongson.cn>
 <5c6f32c841d34a9f370b5a0981a71cb23bc6e62a.1785480242.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 09:57:00 +0000
Message-Id: <20260731095701.1B2771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing NULL check for `device_get_match_data()` return value in p=
robe.
- [High] The driver registers a thermal sensor found at an arbitrary device=
 tree index but completely ignores this index during hardware configuration=
, hardcoding register operations to sensor 0.
--

--- Patch [4]: [PATCH v3 4/5] dt-bindings: thermal: loongson,ls2k-thermal: =
Add compatible for Loongson-2K0300 ---
commit 52153439c55d2e646aae8a83ae212f55c09dcf24
Author: Binbin Zhou <zhoubinbin@loongson.cn>

dt-bindings: thermal: loongson,ls2k-thermal: Add compatible for Loongson-2K=
0300

This commit adds the loongson,ls2k0300-thermal compatible string to the
device tree bindings. It mandates the loongson,chipid property for this new
SoC variant to provide a syscon phandle for temperature calculation.

> diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.=
yaml
> index 79e691b08341c..d312e27737a20 100644
> --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
> @@ -10,13 +10,11 @@ maintainers:
>    - zhanghongchen <zhanghongchen@loongson.cn>
>    - Yinbo Zhu <zhuyinbo@loongson.cn>
> =20
> -allOf:
> -  - $ref: /schemas/thermal/thermal-sensor.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - loongson,ls2k0300-thermal
>            - loongson,ls2k1000-thermal
>            - loongson,ls2k2000-thermal
>        - items:

[ ... ]

[Severity: High]
This is a pre-existing issue, but can this code result in a null pointer
dereference?

If the driver is bound to a device via the sysfs bind interface without a
matching device tree node, device_get_match_data() returns null:

drivers/thermal/loongson2_thermal.c:loongson2_thermal_probe() {
    ...
	data->chip_data =3D device_get_match_data(dev);

	data->ctrl_reg =3D devm_platform_ioremap_resource(pdev, 0);
	if (IS_ERR(data->ctrl_reg))
		return PTR_ERR(data->ctrl_reg);

	/* The temperature output register is separate for Loongson-2K2000 */
	if (data->chip_data->flags & LS2K2000_THSENS_OUT_FLAG) {
    ...
}

Does this path blindly dereference data->chip_data via
data->chip_data->flags before any validation?

Could this allow a root user or privileged process writing to sysfs to crash
the kernel?

[Severity: High]
This is a pre-existing issue, but does this driver ignore the dynamically
discovered sensor index during hardware configuration?

The probe loop successfully registers the first available sensor index found
in the device tree, but doesn't store it to update the internal sensor
selection state:

drivers/thermal/loongson2_thermal.c:loongson2_thermal_probe() {
    ...
	for (i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
		tzd =3D devm_thermal_of_zone_register(dev, i, data, data->chip_data->ther=
mal_ops);
		if (!IS_ERR(tzd))
			break;
    ...
}

Later, the hardware operations calculate the offset using the statically
hardcoded thermal_sensor_sel from the constant match data:

drivers/thermal/loongson2_thermal.c:loongson2_set_ctrl_regs() {
    ...
	int reg_off  =3D data->chip_data->thermal_sensor_sel * 2;
    ...
}

Will this always configure temperature thresholds and read temperatures for
sensor 0, even if a thermal zone was registered for a different sensor inde=
x?

A related patch in this series (thermal/drivers/loongson2: Correct thermal
sensor registration loop) actively enables this buggy path to be reached by
continuing on -ENODEV instead of aborting.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785480242.gi=
t.zhoubinbin@loongson.cn?part=3D4
