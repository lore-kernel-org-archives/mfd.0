Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE34B4035;
	Thu, 17 Sep 2026 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685987; cv=none; b=BfKp3XuD5f3uqlXVmrgaUy9iaH3Kh9Cu2W40HSR4CVGA3V6oP7rQ2S4Y3kn8xKO6IGACYnc163XpffUTh/KcFn/4VuwqjqokHXSibGXF+pQFsCptVf1nxkJHEap9xVSMnyfvE2gspS3mxjTU1F1eIteJJZk6jc2tL5Olax7bRFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685987; c=relaxed/simple;
	bh=1hJsOgHBQrY23f3kVXYnUV/wlmKQmfxAL4bgLI8Z1Yc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iteYeRSx2dG4h6yZPDzK73PPPRg433j0PFHIZT37bjhtPQESrthXo4y/RQgHBSTCU1W7eLjY3/JwzZcRF7Kl81Z2sd/3EmteUJU4kIvT6M8gzsdFAzuer8a6PHFrhUvnj9d4DCclQxByYlBxiY+0Q4JW8fDKI6tThuPJr4gyUjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmommViG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmommViG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9D81F008A4;
	Thu, 17 Sep 2026 22:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685983;
	bh=1hJsOgHBQrY23f3kVXYnUV/wlmKQmfxAL4bgLI8Z1Yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RmommViGrd0QcVs4gJ+Lsq2X0HJM7ISJ27qQAVvkzJGRyvCJoIAYlR4JWS0V0Xxu3
	 msIeC0WwbLx3geTrhHpqnqiYzp/wfDhPbcwryVkyeIj25l6JqB+ixxyM3w0hpatXUw
	 27ho28lO1s4y51pMbJNJ1yqs0Ahxec/mz02aUXfLQ3HLz+JExtixzWZjiZoH7yewXQ
	 Tv76gGupr+U+g3xu6pEO1q/Qgg2lAQjZuC6M9w/OhkvmXx7KlETq/TeVeR7p9RmAzp
	 JD/2eKC31jGaZCt290MSoK+ahAb4hwEtdFs5M+43HY8BYAzRce+UBlYwL/H+P335ja
	 Q5LntAjpnhnfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/9] ASoC: dt-bindings: sound: Prepare Ux500 audio
 graph links
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-ux500-simple-sound-v2-1-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-1-88d29416e3c3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 22:59:42 +0000
Message-Id: <20260917225943.0B9D81F008A4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Audio graph card drivers parse TDM slot data and continuous clock
> selection from endpoint nodes. The audio graph endpoint schema describes
> slot count and width directly but does not cover sparse slot masks or
> continuous clocking. Reference the common TDM slot schema so TX and RX
> masks are documented, and add the continuous-clock flag.
>=20
> Replace the incomplete Ux500 MSP text binding with a DT schema that
> describes the clocks, reset, DMA channels and power supply consumed by
> the driver. Define the MSP as a zero-cell sound DAI provider and allow
> it to expose an audio graph port.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ux500-simp=
le-sound-v2-0-88d29416e3c3@kernel.org?part=3D1

