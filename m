Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD3A220F2D;
	Thu,  6 Aug 2026 02:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983561; cv=none; b=As5AHGdWyuPIchjBC7G6ViL9M383BHYOWpJthm+oTgMRFyGw8dwsmhnxAefcr228RU712X7cJohpEWKZI6nvMvcgNzjRhJwx8vVz7zCO90CM0dakrlAiiikiwIi9uysXPIcsGsbS7dgjRs5SbCRRZHGU4DpP3HfNWQN3B3zrU8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983561; c=relaxed/simple;
	bh=+3w29EOhvAnKdZOtQUOd7BkaFQWAEfRbqY6oJI+9F0k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FL2IhAtzrp6A/CTrxXbYxhATEtSi1wkWMfxBHUGPdGrX14ZIp9f81Wh3S4LPrDQRqEJv3btXQ8dL+k+2mpRTz4YhY+obaVd4oqFBR5Y+YpCljtZD9ItoO20M9HhnRSPhp3uKuVVqUcV8099pf86KHQAw9oFNeT6zayUX1duU6kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opXPfry9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opXPfry9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10351F000E9;
	Thu,  6 Aug 2026 02:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785983560;
	bh=itZmVM6qA3a3CQ1KBUEuePaOminbIA+UMwol+cLt7yM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=opXPfry9CfUKkSenxgfFWKobFu3CEBi+8I6u096FobI/QYEjNkl5hoQPx61nmfh8/
	 SOsJQzuAfLmKduy9QGtqC92yT4XzmxP2LLDSBlhm/CwE0VcIMUA3XZ0mk9JsoRLu4Y
	 kWPrRnF3rylTczBIqTBeymPnC7sYzegBtKyu+Ek9hRRfBobXf/FhNlXIDAHk4FTEeR
	 MAFcxY60CjGPTndG+/CXN+334ZWwFsKsaJkKIznkNPKDQnc4yQlgZV8wfxB90+YivN
	 tLXexdyw5LvvXDk9o0ObFMJOEqdHb1GupBH6Y8S3JSYzmS1rvl9REBMabBIRDjS8Si
	 A9AFEZNFElyOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/8] dt-bindings: net: x-powers: add AC200
 EPHY control
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-1-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-1-3eef49ff1d8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:32:38 +0000
Message-Id: <20260806023239.D10351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The YAML binding schema is missing the mandatory `examples:` sectio=
n.
--

--- Patch [1]: [PATCH net-next v2 1/8] dt-bindings: net: x-powers: add AC20=
0 EPHY control ---
commit e7e7a5a68f157d374c9eb4fdb6add2b0b9d23284
Author: James Hilliard <james.hilliard1@gmail.com>

dt-bindings: net: x-powers: add AC200 EPHY control

This commit adds the device tree binding for the X-Powers AC200 Fast Ethern=
et
PHY control function. It describes the control logic and an optional SoC SID
calibration cell used by the AC200 I2C regmap.

> diff --git a/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ct=
l.yaml b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
> new file mode 100644
> index 0000000000000..5bb60542030fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml

[ ... ]

> required:
>   - compatible
>=20
> dependentRequired:
>   nvmem-cells: [ nvmem-cell-names ]
>=20
> additionalProperties: false
> ...

[Severity: Low]
Is this YAML binding schema missing the examples section?=20

Device tree bindings typically require an examples section at the end of the
document. Without it, developers lack documentation on how to construct the
node, and the dt_binding_check tooling has no concrete representation to
validate the schema against to ensure constraints like dependentRequired wo=
rk
as intended.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-submit-acx=
00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com?part=3D1
