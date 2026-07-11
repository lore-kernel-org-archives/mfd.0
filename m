Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8C9282F0C;
	Sat, 11 Jul 2026 06:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750395; cv=none; b=I1MMyVmF3cnQlUyvBdGL0lE3kkUEBaz+o4Gc1Z4SaUuPYpUasmvCjWFdNVHuX6g2RGXPuSKLxCdvkZ4phHlls4pF+J+cUKDIpLmna17poN+JGswaehsHp86h3nFaeIeYj8pdVEFFPl0AgJYwbewH5tm4cQUh0BWrScM0GenBanM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750395; c=relaxed/simple;
	bh=it+oYZ5v0yCTmLV9Pvin6MNvwGCKJHsdbn7h5XwmXu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NOD8GiO0Tv5NW6gGgoiHp7EC6PxpZNBc3ltlcRbr94Iq9Bw83idbq2sxmYeNKqqYhdkYm1drlIRfLacfIrUsl8alE1b1m3FTtPPreRODKn/Ab8+LBpJWNLsE/kKt62FNcLsAEOrLDWaLNuGRHxa9Qhoudu1DlmsRF2bX6hpUj2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTnxTwgf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTnxTwgf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D941F000E9;
	Sat, 11 Jul 2026 06:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783750393;
	bh=it+oYZ5v0yCTmLV9Pvin6MNvwGCKJHsdbn7h5XwmXu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTnxTwgfhkvjT7YP7ausmO+U4DunkS/96yD982GkHx1109Yu2BU1g+JzGNwBVlyR8
	 CQ8803CP10jvRZDqCEJvgqPnlj7Q9NtrupIhRfoqQkoqAvj60FWS0WV8gC8kXTIPKh
	 HRiP4x0FTmMMil4PLqRlFjVa1pPjWLCUFME30Knhq5NmfPi8cv2hqVj7axedLyruu1
	 8lzCJqf3AC4fZ8CLCFiHkDa5qmG2lMiIxKQGHqZeQPCoKjaowyoqvClIVhJm2t7qTG
	 oeAwNRZYVEtZ9bX42C3EBLNz7Ei+EZAp3E2LV3duGkjDnbMSLfiiahVUexvQbDVXfS
	 YJqJE4rIcOvKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/16] arm: omap2: remove remaining pdata-quirks for
 pandora legacy devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <d380941287c655a3d205ee8b08516d364c0ddec9.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <d380941287c655a3d205ee8b08516d364c0ddec9.1783749722.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 06:13:12 +0000
Message-Id: <20260711061313.66D941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> After updating the pandora-backligt setup and removing the omap3pandora
> sound system and defining related gpios by device tree, we can remove
> omap3_pandora_legacy_init() and the related legacy devices completely.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783749722.gi=
t.hns@goldelico.com?part=3D16

