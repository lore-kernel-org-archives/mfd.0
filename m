Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D4F40F8ED
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057197; cv=none; b=oXnsHrnIeFwCtPP8FdWEUbO5fXV66w4WGENvdSAjwyD8b5Is6RoNWRIF3Ef4XxT+K8FVKMYPyU93A/NquC7LwjSD5gaXsgZA4s3BFBSd/Y5FVdb5ai6+BlQumXSRqbl8brrCtz/mEaMRd1QR10qqknzKrl6uBbdNyUDCXMS+qqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057197; c=relaxed/simple;
	bh=mm1c88YeK46ywd4vnoHV5qVgRdGfDRn0P6KM+CWUXdw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HwNdyLzytjutPDPwM2rReoGyr6H92G/XgvnMM6PMz0fxuiAbZOQbxYRNxoXj9xatoNyrpFQMJqOTt0SaXRdLfofJ78VI3uReejD6kHCEBRDsD7c9gryfNl3hx1QlJwuyYGCuduRvPtyzapm8I3QM/1rSTPHs0e0VUvxLtRBu5U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=am1Jx70P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="am1Jx70P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A6E1F000C4;
	Thu, 15 Oct 2026 09:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057196;
	bh=mm1c88YeK46ywd4vnoHV5qVgRdGfDRn0P6KM+CWUXdw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=am1Jx70PjVoAmu/G8HcpPLfmBFS89Ijft53ZM85jcba2aNr85T8el5XXUWkXkfjdC
	 wABTPJzmFlKXWhMwyJJVhrtU8myG3i3dmT0O6XLxjXvuMAWn3U7Abhmq20K5kjJVks
	 lRRNlhg/M9bGN7NX6Fy3cyG7CemVnTruvkjMukQsz/g77jzX2ephBjcTs+vSrSUM47
	 OfVhUpNWGwijab9lZpVpQ5hoOU70R9L52cpq19bpNXhuzXcSlTrhI4uRPjissXrT4B
	 Q/ZnwsIg7pETk+5aS6YTRdO7MF4f7QeeQ0dHNYbZw6F8k5p9J8bMKKKM3OzyjVUlnN
	 SkYnQeuyT1HJw==
Message-ID: <sashiko-outbox-172585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:39:55 +0000
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-sm8150-dis=
play-card-v1-0-5c14928cef29@oss.qualcomm.com?part=3D8

