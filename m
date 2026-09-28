Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E4478E38;
	Mon, 28 Sep 2026 21:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629399; cv=none; b=CYPM8PK7CRMo1pqsS3ubP9yVdYNDb4RV/jd3WzrCPbg4tgh7Vxux479uSK6sTlsvw9zqMutouCh+ZumAggxBEYJ9+s/qYg9kkgk9SQu8FqOqDJk7pB0BSAX4Dt8v603YFyLQbmUNxIkXYH/ttdIE/dkyWkOBTdX6ZDmePik+knE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629399; c=relaxed/simple;
	bh=CVXnRc1ZJ2b+jGAY8mVE24bhODMDuhW4ZO18+2UE5Ck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FkO71PK+5TJ2kX/LAjAI2VbpEd+hf2JZWmaUHm+ei6BNJ5oSMAUPHqCZCJYmSjh0RDiTG2ril+diEknjiwmvrkZCSSKaavRX/1xlto4g1qlICqnpTHAO3BC5R2OWlxAyk2Uzpl0jkZdrQSAYIx2/0sIGMEyMC+9IX7bo3F9sCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5zWYLyx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5zWYLyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605BD1F000FF;
	Mon, 28 Sep 2026 21:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790629397;
	bh=CVXnRc1ZJ2b+jGAY8mVE24bhODMDuhW4ZO18+2UE5Ck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n5zWYLyxAjLemAFGcO0lmk0dBDSZbcoDu/xjCoEvE9sYho+wQvSpzf1qybavMe8o9
	 cGV/1fHO1D/GodY+TWfqd1aRL+RvzrZdmcRO+KKMhiHgTk2WY5m4CkoqVJh11UwPun
	 vr3vrC31ds7ab19f/+t8m841hGzEniDLWwQq7i/jAQfYN3QIvcouFqmJfVaF9cpidI
	 Rw8GTmESCn/GJjcYTNLiJHhwhN4+lFOEh8+o80qmmzNhtw2fGrXTfh3cUfpElFvRqj
	 qsD23pPl/W133ZXIbDj8/gc5ovXdUopMZHXpXYO4d4UMmQ3QFK4C4+dFt0rXmtJQyw
	 Iwq4xq7m2M2Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc:
 add mt6397 PMIC AUXADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-1-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
 <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-1-23533a0d30e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 21:03:16 +0000
Message-Id: <20260928210317.605BD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
> and battery temperature measurements. It is not register compatible with
> mt6359: a conversion is requested by writing a channel number to a select
> field and pulsing an edge triggered start bit rather than by setting the
> channel's bit in a request register, and the results live elsewhere.
> It therefore gets its own compatible rather than a fallback.
>=20
> Add the binding and the header naming the channels a consumer puts in
> io-channels. The battery channel is named for the input it measures,
> ISENSE, which is what mt6323-auxadc calls the same input.
>=20
> Assisted-by: LLM
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-rbrue-suez=
-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com?part=3D1

