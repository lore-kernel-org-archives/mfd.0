Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D432A299920;
	Sun, 30 Aug 2026 22:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130227; cv=none; b=FgB7KCBLP1Vo2JvcfGcht7slbX+aqAC7qWxzLJYYSaqCqS3sa5jSDInkJWg3liP/zCIdW2WZJKfTf4uugERr2SqmGxlZO27GuMifnFx+LDugaNwrp6ucsJeQpfCIu2uFBI3sxZJmkx1s7KdtZvXA9NXbqPn2MLbkDIiYO9F9YgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130227; c=relaxed/simple;
	bh=ejwtaYk94J38aBIF0kGcqHVxcnMweMkN7TXsUDNtQx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gibaFqer0dKnt99wFMMZkQFgH74Jj/MruVIWeRhpRePXnRjCbka4fgTMStYqEXkwnorsVv2JXQ8BMazqoX8xBsrvlnhGYACAOPvrHluqW8pPj45LxdLnKREz2xNDuBNz9xZj9FEFm7GedxVuipLn4zhYYcCBCBGkx+88YpD5w4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HB1emI8U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HB1emI8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403581F000E9;
	Sun, 30 Aug 2026 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130226;
	bh=ejwtaYk94J38aBIF0kGcqHVxcnMweMkN7TXsUDNtQx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HB1emI8Uuwcfxyx4T1MkC3s9C+sBg+KH46XXkf91dIUK5xmbLMqo4hBVr8Ws1U7Vq
	 ogrW0k1ZOYeF2WWdS6s1qeKFbT7sPxMoTLaF3udGVmsfDr6lU5gIuDDUPQV8c4hvRZ
	 3SsIt3ubknbgKDr7hhAEWxa2j53srgh3YyQ79hdgYT81LPdd++VCY6PKJIsYlfDSSE
	 epatGBBf8P1oZgijAjYQYsdmDjBH1bG/YYv+GAqmo6hkSnbK/t+ddE0kaKmlMeg6+V
	 tIT3EX79gRdzVinlGL5TxtWwhh8BdjCb4eML80NRykv2R6e8tnPxvHaJ9fm7gzs9vP
	 xloaPw9VVGGWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/13] dt-bindings: mfd: ab8500: Add regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-8-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-8-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:50:25 +0000
Message-Id: <20260830225026.403581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The buck converters were not initially added to the device tree or
> drivers as they are mostly always-on, but their outputs supply devices
> which need to reference the correct regulator.
>=20
> Describe the six AB8500 buck converters when the regulator node uses
> "stericsson,ab8500-regulator". Describe the AB8505 converters under
> their native VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM names when
> the node uses "stericsson,ab8505-regulator".
>=20
> Keeping the two namespaces conditional on the regulator compatible
> avoids representing the distinct AB8505 VSAFE and VSMPSC rails with the
> AB8500 SMPS3 and VAPE node names.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D8

