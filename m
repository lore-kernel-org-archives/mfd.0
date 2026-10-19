Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE273E5A22
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409275; cv=none; b=InoNm6+D/HXS8QYiN6fR/DQRVCdWRReNDrlZjhwZ4rpnwnmonTUn0HTFQlxwxdcvKRJ3PNZdO74iUmYPipAr6WVI9Z2tqHylztBFU/pJhivZseAnL7PDnyT0IkT2Z+FpRu5pvpnnQmCorKGgPpxiKvY+7S4iqoIQIq7sYOi+Un0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409275; c=relaxed/simple;
	bh=vfPMNIgBd0trRPSSUKdb6CijfGd72aliTFn477ZhVyk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RtrXmJBhiDdwNVQ+0jOcdwx79mbtxfjsaLkpUsKxEX1NrxjJY6PhZqYZCJuNMsfV4tHUNZpPusRma9R6ufzhH7v7O5nUQrBWhLk8wcXTKGiDVz+3/zdfiak4qz4YDqLCaiu51V+Gs8t1gzVQhlT7jsqzFe/XjoH2hA/xfraGX3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1OZHsiv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1OZHsiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992EA1F000C4;
	Mon, 19 Oct 2026 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792409273;
	bh=vfPMNIgBd0trRPSSUKdb6CijfGd72aliTFn477ZhVyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G1OZHsivuNWsB13+bC0Ig2Sy90hO7lLDM63H6Z+n9/N9MdlWjQEAyBlDXUzfGn6gg
	 UybrXNtxTUdg17m5Lt/pRI0OhwPInrr/wa5BQpQxqYoW8WtTrSS0tm7GZf7gzFMHo3
	 zIkboPunGlHqL3BYGBCL6Dpm4RVZA5pV58DGhCcCLWETs0K+318IT5W4qHPA6u/Zsr
	 ttd1RvGc4zKbrcnQT3IlTEvQ6syHi4ZDu+FXNvaRat9zC91DrG/lGk9cjvRRNllYPQ
	 earaSy+3JgOoIW50iXkgCAaax+sqaF57DpoXAPEIgqLjMH7MnCGrEgeIcDvFCOgUVt
	 4Ul3xrb/DyoJg==
Message-ID: <sashiko-outbox-177035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/8] regulator: dt-bindings: add Qualcomm LCDB
 regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019-sm8150-display-card-v2-2-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-2-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:27:53 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Several Qualcomm PMICs have an LCDB block providing the positive and
> negative bias rails for LCD panels. It is not supported by Linux, so
> boards using it either model the rails as dummy fixed regulators and
> depend on the state left by the bootloader.
>=20
> Describe the LCDB regulator present on the PM8150L. Use it as a fallback
> compatible for LCDB blocks on PMI632 and PM6150L. PM660L has a different
> version of LCDB block, so it's not being covered.
>=20
> Assisted-by: LLM
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-sm8150-dis=
play-card-v2-0-86c05068efc5@oss.qualcomm.com?part=3D2

