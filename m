Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1746D54D;
	Tue,  4 Aug 2026 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858293; cv=none; b=J0VZlPQb5jsvOt0r+H9oPyZ4c+Gh+31vXfGkWli2baYNIONPUKdQx+VWbQfDfrDfQguv4PNsigdZZNj35tEqXl58m26T0tRGP5LX57ClWb791SgTHbzKYJ5nx4iocrwrUXyTTnuidfylgkHJkPcd5sgzLfejTrJ0mZC4nqvQYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858293; c=relaxed/simple;
	bh=ov1fuU2kULc3aC9n2F1tFHTkl3JOt9ZjiDNbYDn2I18=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HtETsyERQyslOOQouTpSTGGpv3bo+LtmTfuTPAp0ZHbqEAJWB0UU/877hcChoH+DrX+IWN3+4lBjPpyfVxCOJ20m34m0hMiwZl246Cfzw6cRhcP7uVamrt5JTcT+Ed9rtHQ6VWnvLcPmRv1wunKjtAzJIYvSO1W/d5KRnDmP/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QS40euDI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QS40euDI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A1A1F00A3A;
	Tue,  4 Aug 2026 15:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785858289;
	bh=aN8bu0MartePY6VmwJrJwuYq6VC49S2KVlAlST0+86s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QS40euDIIzjfkYGdJcs2elWRvL4iv1QH2HZUcIRO77xyuiff5q8Q6h9MkWGzK1Kp0
	 E6HRzSLrdPlOinY7r/UlPV2Indg7lNcjZWUS6kYJ3v66F+QqJboUdgkDwEZziHtMc/
	 +VpJcfIkzxb2+xNi80PXTww6Mc6SKKIXksttCOtIHd8OxkSrANLNBb3GVVsuoj9HTa
	 6wy4/OY86S+M0DZ+BEmLh7z/K2mCLp6zoPr81vKmPiKVJvn0tD60ce3GldL/t2k+hX
	 9TKSIKcJ0rg7OL3d0qS8CboYr1guPy2gD5NXzJ1X41exTbWyj23LBv1UkB1zjSr3FD
	 CR4tL1f0A4n3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] dt-bindings: mfd: netronix,ntxec: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-mfd-syspower-v1-5-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-5-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:44:49 +0000
Message-Id: <20260804154449.83A1A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces a schema `$ref` to `/schemas/power/power-contr=
oller.yaml#`, which does not exist in the source tree, breaking schema vali=
dation.
--

--- Patch [5]: [PATCH 05/10] dt-bindings: mfd: netronix,ntxec: Use generic =
power-controller schema ---
commit c8d8d2474f8ae06d3e1689a3ed174b683577d897
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: mfd: netronix,ntxec: Use generic power-controller schema
   =20
This commit updates the netronix,ntxec binding to use the generic
power-controller schema by adding a reference to power-controller.yaml
and removing the locally defined system-power-controller property.

> diff --git a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml b/=
Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
> index 37fbb953ea12e..2fa8b797c0dcf 100644
> --- a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
> @@ -13,6 +13,9 @@ description: |
>    This EC is found in e-book readers of multiple brands (e.g. Kobo, Toli=
no), and
>    is typically implemented as a TI MSP430 microcontroller.
> =20
> +allOf:
> +  - $ref: /schemas/power/power-controller.yaml#

[Severity: Low]
Does power-controller.yaml exist in the kernel tree at this commit?=20

It appears the generic power controller schema might still be a .txt file.
Referencing a non-existent YAML file causes the dt_binding_check target to
fail with an unresolved reference error.=20

Additionally, because unevaluatedProperties is set to false in this binding,
failing to resolve the schema means the system-power-controller property
used in the example will be flagged as an invalid property.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mfd-syspow=
er-v1-0-a440783c2e78@nxp.com?part=3D5
