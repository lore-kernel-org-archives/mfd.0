Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D85C4E36F9
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409263; cv=none; b=YKsZZFada8PBaWdApxcSE9HJhM+PoJdJuGa4Tv8yTIUMfK+2DmUwSY5bk0xgGQ9c1zspB9x3r/MaqWPsZn/LMwIxVf6MF5auL+IuckT4HJ5jnXJUKGNo+4pmFCSWxQmIfF20nu4knOdwhYPubjJyemMCTRZIHfJO88B60ZDQ0Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409263; c=relaxed/simple;
	bh=Ct/vnJ28h4u9Af1hkudhYhUhDu0wTMX2nPK6nNkmXaQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VWfxhZa7RlJ2EbT98ot4QAWzAbO3/cBOoOmehdZJmYwf2mfpV5Sprje9n+lqAz5lvJ/P94cEmakj/IU9TtjAh17JiUZeaObdE9B1LydfjbZmt8wJxWzPf9bqujp3sQKavjBg+oXvbPZYzg741i+XfunU5ux1nSpjSILrw6xEsbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTTHhJEe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTTHhJEe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C352B1F000C4;
	Mon, 19 Oct 2026 11:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792409258;
	bh=Ct/vnJ28h4u9Af1hkudhYhUhDu0wTMX2nPK6nNkmXaQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FTTHhJEeLQPP+6zq1fzCW2tshlUBDWe7j1+cxfzFALwkkPLJ+vhFU6iydQTknibm0
	 aVBlxGLqxyl4Tk/k2ruQlmukHlcLI2pUVm4wEyBZD/aRHd2kYUM6RWRY7Nb4iPuQzq
	 LWuKKhpJiCjxr6zVkG8gplklLkv1kwCq+36dzPC2ZKVRM45sPllmojL/wGNiMjLG3b
	 TblsjcVidPug14VNny641q9r5qHGsUhIQrtbSE6h832XjRF7GY5frIK7SHwisQjZmZ
	 7hqFm9vb7SlK/lvHHt75B4ppwwhfVAD678DHGjpxtvmp5XbqPaXS6zLHs/CMX8lWtw
	 GSs1OmnOQ6dRg==
Message-ID: <sashiko-outbox-177034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm8150-hdk: fix FSA4480
 address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019-sm8150-display-card-v2-7-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-7-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:27:37 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
> the wrong address the mux driver fails to probe, the Type-C controller
> and the DisplayPort controller keep waiting for it and the display
> subsystem never binds.
>=20
> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort an=
d USB-C altmode")
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-sm8150-dis=
play-card-v2-0-86c05068efc5@oss.qualcomm.com?part=3D7

