Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B7E4562B5;
	Tue,  4 Aug 2026 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856992; cv=none; b=ATyeer+KXZ3FKum8sEmQgmQbEdHVa80kyLXvQG+JKwmTBscqwbbSn5Apd0xvolsy8t8MaN6iMb7iIrKRUXxWPyuQAO969oM9/jLoC1c1ru8clA54+LdOWHpgZN6lnQRfuV0HOfD0VEmqJpLAOLprS9CE5pwUdtfFP7Zv3dzH0ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856992; c=relaxed/simple;
	bh=atjks5Rk3N1QNIDCInop8ozRVqlvA85OHSrEQNxIQvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HOdxOQRguOalLebjzPWxehzdAVIadQuzvsc7DA8jNa0Y4iaY5jjofeHuJxVd5FVv7+cqn0tU0hIFvhGZY07AZP1IjJRe7rO2Imvtl6g6yFnX3IWO9kc5aHfVY4hi+3FfN9WMlKdkrQU+VstGO6a9YewVtNZd4tx+3NGPKZZ2QVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFnwJQNj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFnwJQNj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDD91F000E9;
	Tue,  4 Aug 2026 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785856990;
	bh=lVZq85Scz2Nv+wwVj1nxmq1/mJ9P8lPaQuzuE6nL0uM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YFnwJQNjIKycxYRKFw2bSARCf6gPN683wYxNcDV3OJrLZCwdOkPQx0fLLiK2tViAg
	 C6N0U9wCVZ0MP/82zryLqb0NoUZXgNZaLEJraOg9ACjKUOOr/udmL41F+FcfcZsfIN
	 UUC1PprXzEKsyoeMxTZmcU0EtCLxPxmmjj52VI+fbZxwsF0eRC5zRLjfQjJtuhUJKc
	 55njHtTm1rCzLLZjhu+v184apGmUwQuf1q+R78sC90xixzQXdkfmxSum081syIaXfc
	 nPpb9RZ0To2wPl0FK6/izHosYqi3OhS1gl80KDkINW/KOePqsQfldh3wQYf39/s0NJ
	 mij56BDyGL96g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: mfd: ti,tps65910: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-mfd-syspower-v1-2-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-2-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:23:09 +0000
Message-Id: <20260804152309.8DDD91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The device tree binding deprecates the vendor-specific `ti,system-=
power-controller` in favor of the generic `system-power-controller` propert=
y, but the driver has not been updated to support it, which will silently b=
reak system power-off functionality if device trees are migrated.
--

--- Patch [2]: [PATCH 02/10] dt-bindings: mfd: ti,tps65910: Use generic pow=
er-controller schema ---
commit ccd015dacbaad9942d09e771f8332a54d584d02f
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: mfd: ti,tps65910: Use generic power-controller schema

This commit deprecates the vendor-specific "ti,system-power-controller"
property in favor of the generic "system-power-controller". It also includes
a reference to the common power-controller.yaml schema.

> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Doc=
umentation/devicetree/bindings/mfd/ti,tps65910.yaml
> index f1a76f88fc0cd..3939e8518a8e7 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
> @@ -72,6 +72,7 @@ properties:
>    ti,system-power-controller:
>      type: boolean
>      description: Identify whether or not this pmic controls the system p=
ower
> +    deprecated: true
> =20
>    ti,sleep-enable:
>      type: boolean
[ ... ]
> @@ -216,7 +218,7 @@ examples:
>              #interrupt-cells =3D <2>;
>              interrupt-controller;
> =20
> -            ti,system-power-controller;
> +            system-power-controller;
> =20
>              ti,vmbch-threshold =3D <0>;
>              ti,vmbch2-threshold =3D <0>;

[Severity: High]
If a user updates their device tree to use the generic property as
recommended by this new example, will system power-off functionality
silently fail?

Looking at the driver, it appears to only check for the deprecated vendor
property:

drivers/mfd/tps65910.c:tps65910_parse_dt() {
    ...
	board_info->pm_off =3D of_property_read_bool(np,
			"ti,system-power-controller");
    ...
}

If the new generic property is used instead of the vendor one in the DT,
tps65910_parse_dt() will leave pm_off as false, preventing pm_power_off
from being registered.=20

Should the driver be updated to support the generic property (for example,
by using of_device_is_system_power_controller()) alongside this binding
change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mfd-syspow=
er-v1-0-a440783c2e78@nxp.com?part=3D2
