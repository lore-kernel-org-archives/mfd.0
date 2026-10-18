Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D03CF1FC
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340080; cv=none; b=HEyv566nPyhS0QKufZrIgNrDr0O8uEvswGujOX3NW8B9LmR519CYMTtz1uwNh5d1TAiUnTDJo6tCqedg6uXfMwRO2lmeb5hz8bdrXAPfxTmDROZV8ztYP0qOvDNl0Mt+vFUJDprsTsb0WIv5vof6hrINBFlRHxpK7CEnHsf28+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340080; c=relaxed/simple;
	bh=j88Qz7JuFvF1udtvPPzY0dXgO2CVyy1Wb4bC8L1JoAo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y5qV5nkQXl4oTQpKvSMK2T4mKV8IaglNI+jjN+wRpiREIl+I2qTlGzjzz5JZfygCMb8OCgCUUnDTRVoOsYcq6NqTcSSxwfYtObsZVIwNvN/uEbutiKkEldUcWmEqWNdz+d+D7PXp8tumKtkwOD2JIlhyU6mwmkIUfL1XRs35MC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mv8FEljY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mv8FEljY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4881F000C4;
	Sun, 18 Oct 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792340079;
	bh=j88Qz7JuFvF1udtvPPzY0dXgO2CVyy1Wb4bC8L1JoAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mv8FEljYZ9/IibgI9gj5pLxgnww4uPoUS4xstBkKGGPFENFZi8pbAIIMvnEgyv7B/
	 mjnY184PpRlA5l49PrEd3yLu7pieKHgonkLcMBILkfiZyWmAAJKXQ46h9IUe5bg+qX
	 DFpN7mUN0ayEv31kYU7+7Rq/z/pLnlGmm2w4lonKURrSI+Yl5rp7+UpTQVff+VV8Yf
	 bYn0/AC6sUPVQ2JldKmv2ML5XPuYvv2CplCawWy0EFHTBlaPVbDSbMVyGLRNDLQQ5D
	 219P8wa5ZS1f+E73uSX2op1xF3zFAJmcykaL893bR/+jq6IuREPHVnbOQwX7cW9OV7
	 p0WlCkIu0+glQ==
Message-ID: <sashiko-outbox-176270@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/8] dt-bindings: interrupt-controller: Add support
 for Realtek DHC SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261018160653.3940371-2-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-2-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:14:38 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: James Tai <james.tai@realtek.com>
>=20
> Add DT binding schema for Realtek DHC (Digital Home Center) SoCs interrupt
> controllers.
>=20
> Signed-off-by: James Tai <james.tai@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018160653.3940=
371-1-eleanor.lin@realtek.com?part=3D1

