Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD6A18CC13
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 02:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130318; cv=none; b=mhptDHUGD+xJOQpTXTuPW/LDWI+H3WOEyGVybIiqeDC4yFZ65G+/waWyMvie1Gy1bf/jy3ZrGzRPr+J2qp4xBzRRocPxfObG12q0Zqby3gvhOlVOCZ09PvrA8bMXgLqbCR1OTFRV0dep/c5ZC68+EQ3zVfCT+Ns4sjie+guZatA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130318; c=relaxed/simple;
	bh=NLrQKrYnXA57VhJ3WD45fMMEJV3yi7WXLKswSgzmfS8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WJHqzhVnO1UBb0k8TOM3bO30OKJ9l4zcMNp0Ha+8PvAg+247ztnZsX/N+XeZcZfZ3VsdJsc4tgapiKX/a9F0t4i2MeF0yyuuzn+ws6DhmmSp2JiZV0g0RYsCBfQOtcN065U1gwWlT+lhauIihgLR17kzEGxLyTYbmksSF9L0/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpOiOtKG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpOiOtKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA24B1F000FF;
	Wed, 23 Sep 2026 02:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790130317;
	bh=NLrQKrYnXA57VhJ3WD45fMMEJV3yi7WXLKswSgzmfS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CpOiOtKGOq76dTjyTkI+Aaoh2yKb2S1H3tg2uss2WnLmeZ3tlLJEeSYItWlnmfkBa
	 PFGtQGpuiHttH7onYsy31tLthSQsLedivtS7EuFA6nGmA76udv6iWDdcdtd90+9s5v
	 WNWLieOitSoi6MfDMsU6zb4O2ivxcLiVz5fmQ7ihUQfsxLNJSJ97rkeSqhJuOCSRNd
	 NnG+fVS404pvvKwC38m/PvPeADL9WQri7072tfbaAI6q0MNUcXa1f16nIM895ROsfX
	 gOAT71jrFKh3GoQzmUYEjAJmE+m43qi6Ad/1QQrr0DDNY0JbWn/Hoxthscc2S8oN2m
	 VZzhjXM/TaiLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: da9150: Balance IRQ wake on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260923021936.957065-1-mhun512@gmail.com>
References: <20260923021936.957065-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 02:25:16 +0000
Message-Id: <20260923022516.DA24B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> DA9150 enables IRQ wake after registering its regmap IRQ chip, but does n=
ot
> disable it on a later probe failure or driver removal. This leaves the wa=
ke
> depth elevated after the handler is removed, and repeated bind attempts c=
an
> accumulate the imbalance.
>=20
> Remember whether enabling IRQ wake succeeded and balance only a successful
> call. Remove MFD children first so their nested IRQ users are gone, then
> disable wake before removing the regmap IRQ chip. Preserve the existing
> non-fatal behavior when IRQ wake cannot be enabled.
>=20
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>=20
> Fixes: b8fce55c09d3 ("mfd: Add support for DA9150 combined charger & fuel=
-gauge device")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923021936.9570=
65-1-mhun512@gmail.com?part=3D1

