Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB7C4E73C3
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409323; cv=none; b=saRGC/JNpRVtMZupWjsDmA+skoCkuAJb+9B/Gm/tHLd38dwgDtHwyqNM/T3/NnLZONNDYCHLMRYg4BdtHzOuGSRQSI3hexg2WK8LyvVha4X+cXdOyV6Eo6TidW5OeW9Py0hC3L5Op7gxnkuJA3w9l6oqeE3VS2FFQT9kdaLL1YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409323; c=relaxed/simple;
	bh=UDqHq6+30UtMmNR0VAOuygCHiwAbtnigW+xddzj4NZk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hsbu3VW+yX0WbTGOMNEFM5p1LCOAOwGL+GT6pf6/SbcLt50OwYiJjjqlUa22lVmZ2l2goZilcvkt9NERMr2PTQJqAG3cXB9Bq/1MzWGZLZr6Kyl1tr8FoQH4666SCIV/ys4bEDWwui/Nxjwm8tvHdbTiWwzysi6JlcSUkCRT+9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy6+LY8W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy6+LY8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ECF1F000C4;
	Mon, 19 Oct 2026 11:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792409320;
	bh=UDqHq6+30UtMmNR0VAOuygCHiwAbtnigW+xddzj4NZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fy6+LY8WPC61smYcNb41LtGP26mTuK6nW/AgDaft5a4jYkPFAEXp1FBI/EI1yWmVv
	 6fQ+U5keioCHN+2BNBEhrtAvJDWwVvdyz3lACFXlPOLqF1K3skw+Tr+kyKqIY0eUX6
	 WJMI7ECG5SXAsCV7lg2cAM+11QHUYON14dIYtUOZIU9EovqIjtZyyS1/3D8NOuWf5w
	 doLhVDG2prS8ec/uc3Iaqby1IvUU2u6uryCUVBUmxXO3or2WYc88hr0rTUoViTpg99
	 zGB8Nf/waiX8kDR/f0LR/2RoiBDydijJy70pXy/0JV885RE7Cnc2E2LjaYW8XT6gUE
	 ygwa33a808sCA==
Message-ID: <sashiko-outbox-177037@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm8150: add MDSS reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019-sm8150-display-card-v2-6-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-6-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:28:39 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The bootloader can leave the display running, as it does on the SM8150
> HDK with the display card attached. Describe the MDSS reset so that the
> driver can bring the hardware into a known state before using it.
>=20
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-sm8150-dis=
play-card-v2-0-86c05068efc5@oss.qualcomm.com?part=3D6

