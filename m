Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0C454B1CA;
	Tue,  8 Sep 2026 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873784; cv=none; b=fZDbwNPTxTADsEdJeLJ2rmQc3etUzAd0qWF7c9fktz2OLWb6BBIdSWG0M10WdSWl8u/hwhsLp9fWnHwA5bhNTt5/Z75RhODWA1KMhV2nKDAVI+3ToHzzsgB7PRwkbEnLzipEQyLpAuBGwtYfVtGPnT7qDculhF8mwmD3NeSkiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873784; c=relaxed/simple;
	bh=7h9GZo98usvok2+4tOTWHnWJ1x3c7oc9aI5Oqwp60Ms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r8X8hFXbhtvAoQMDqdN33ncMsj/AeF12Q5KVGsZpF6P2mw7QyCF/bIl/R36vYhGfS9OqRj2TETmplXNNgozMgP5gzcv+5HGqwj660SLPOoYqq3daS+KHwEo66M3ynFQJdzwbmwOYkPV2JXSKlsfhLGsAaBDGkVFwpFwPZz0Io8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4IUO4IU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4IUO4IU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436F81F00A3F;
	Tue,  8 Sep 2026 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788873771;
	bh=6nxqgQmy9Ln5ZT9J27xe09YdBOwtkin8kSyj12PzahA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4IUO4IUJekLf1/jzzOWtXxo73uGIj7GigDM+88Qy2K5veZX25rR8znU0X812JTeB
	 8hbJ6UL9beGinDgcuoYUfa6tUDFfsgyNJTooMTC2xA8iZx5LwBS5Q45iQDi71GJUyv
	 latwM9diMoEObbfmDRnJDDENePqZfy2kVx3kAN7H+SqiLlATwrEYaYnnxUF0BMZ3g/
	 lyefAGtHGjQkW1yNCgYQ9oNKN2TLqeM47wgwQ94vXZSt62mCmpaf8E7vbxRaDEGYq3
	 WDm8s6yPee1qTYytAY6nnZMQC18aIxqXBbLfUhUpwVLpDqeLxtGB/hdeU3LYVaVP8F
	 Zb5dRn8Hqzo2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,pm8008: make the interrupt
 line optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908130745.2545-2-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
 <20260908130745.2545-2-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 13:22:48 +0000
Message-Id: <20260908132251.436F81F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing mutual dependency between `interrupt-controller` and `#i=
nterrupt-cells` allows incomplete device tree nodes to pass schema validati=
on.
--

commit 06521a0a86f05dc0e7f24260abb779ba95c5ab55
Author: Oleg Keri <okerixx@gmail.com>

dt-bindings: mfd: qcom,pm8008: make the interrupt line optional

The PM8008 raises an interrupt for its own status, its temperature alarm
and its two GPIOs, but the pin does not have to be routed. This commit drops
interrupts, interrupt-controller, and #interrupt-cells from the required li=
st
and adds dependentRequired constraints.

> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Doc=
umentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> index 0c6e1870db1dc..db1592e115e8c 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
[ ... ]
> @@ -97,10 +96,12 @@ required:
>    - gpio-controller
>    - "#gpio-cells"
>    - gpio-ranges
> -  - interrupt-controller
> -  - "#interrupt-cells"
>    - "#thermal-sensor-cells"
> =20
> +dependentRequired:
> +  interrupt-controller: [ interrupts ]
> +  "#interrupt-cells": [ interrupts ]
> +

[Severity: Medium]
Does this regression allow incomplete device tree nodes to pass schema
validation?

The missing mutual dependency between interrupt-controller and
#interrupt-cells means a device tree node could provide interrupt-controller
but omit #interrupt-cells (or vice versa) and still pass validation.

Such a node would fail to function correctly at runtime as an interrupt
provider. Should these two properties be required together?

>  additionalProperties: false
> =20
>  examples:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908130745.2545=
-1-okerixx@gmail.com?part=3D1
