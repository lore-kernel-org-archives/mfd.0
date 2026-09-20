Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9533D333E;
	Sun, 20 Sep 2026 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789882978; cv=none; b=gXsWgpIeDyzO6VMjNdDMsZZWylBkDziBDaydWfBYDQRWBPaJ9l7vXk8ZBjA6ADWgh/oUjDOFym5HfMMXVuvztmph6p1x6aCNbaKF5mABSUvCR6LByqS79fQ8pM+DrEM+pHRcPNjuVhIBqmxrNKV1apa6qHJvFwyfXsCVPRUdRr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789882978; c=relaxed/simple;
	bh=nMY9LDTFabMKL374dEhq7Z7BY9s39KXhenQkAULRtJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RS/J+OnL6vuSu5JAxC1zIefqOS0YdoKOl+9wJNL24wqnCcepMFyHgPlxrBputh2K4EZ9Gmlrzf5d0Yfn5jruGolhUS53MK9Zz2AFZwwVx2Qpcr6iwt9tD8JF+QcM1krKT9K7M2THPpKixNtyoR6WFfECRTfpybARqa5UUh2UA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mssi62pv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mssi62pv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964A71F000FF;
	Sun, 20 Sep 2026 05:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789882976;
	bh=nMY9LDTFabMKL374dEhq7Z7BY9s39KXhenQkAULRtJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mssi62pv+1o4djf66x0HPAxuvREyQX1KomiM8RZv2e4KRwXAxZzFHQ6bs8Osfpmhx
	 egKnszI27wFTNqDZQcLHhYBjzFx3KpHjFhrz+pSoI0kIAMm/AQdk+pJGKvSjNdIie7
	 UBoPm07grrG725KsjY+Qc4A20DUzEiHc+MzkhljmmD0jj+D/P42fsPHUb7pxSVt0yz
	 ueGe2l/vD06lo11EwBwJMMQ0dqFaq1L8689xm5tAHyLsiVkzvkN/Hn0OJKT8vliNoh
	 Obf7VcBmUt+VkwefFWUJA41venf5ytVua+ZSiIo8aP23MU7IA0LT8hKG8BzMG8r4ME
	 MPalXpCa25AqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc:
 add mt6397 PMIC AUXADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:42:56 +0000
Message-Id: <20260920054256.964A71F000FF@smtp.kernel.org>
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
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-rbrue-suez=
-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com?part=3D1

