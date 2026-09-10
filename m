Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476C433EB06;
	Thu, 10 Sep 2026 23:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081704; cv=none; b=Gh2Okipq4bN7PKvx0dnrZ9va9lQWWeH7t+TKzAVylB1Uppp5gOwUk2EoXmFONdiTUmVwLKVtq5q50DN42D9CTJHR8732/D1dFOGPw3r+dUZrBuUkMvQKvr5IruR/3ELUuBij+o22Deo5tiv9yMhwibgXSEr1I5ghoiTgsMLGsyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081704; c=relaxed/simple;
	bh=j6ya/NLxeRFWT+7DgEQYmJ4bMZsq/tNx+4SoUlRLyoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=loKrnskLRoDUleOqRnxhLZtWpkx8UTC1QexZxrtX63lr1RzA3PitIyniujerE0oea1leXYpr6UQAaklRdkCQkPWHAv8Lh7qgVhlF0kBt32QRKswQRJNwW+SP0KR1dEFYmdjZ2miC+8mR4OchLtTMqXGtOBWvW+eI8+Wjn8CBt9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLqjqsjM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLqjqsjM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812A41F000FF;
	Thu, 10 Sep 2026 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081702;
	bh=j6ya/NLxeRFWT+7DgEQYmJ4bMZsq/tNx+4SoUlRLyoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fLqjqsjM+0ad9j+j/EGWT2XEAHAHA5QwJfLDTGVM28NA4v1o0EXARhF+yEKRg2qP4
	 oruqVQOoL0NE01ZwGD9lnvsQ5fHHYrJJwPYlrmBp9lOmiCWg9BDHvFShiMVivCwTM4
	 VVbFuEA8hYalpeB5wUYibUD0Zwn0qvSS7sCywQ4xtFka+7Ng4baebxqQBqCpVjXX5O
	 yWaq2pSRVZMQXW3dQYUP33HeJXynM+C43athd6B8fY/pPwJ57apVKkP0aIGaLxfyoc
	 OG5erSKhX8Vy2pkBSpfTpd/N1D9G9h88CLZrckf5yUDBGTuy374q91EOR5Wchcur2j
	 vyNnizpQ+706w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/9] mfd: dt-bindings: ab8500: Describe codec DAI and
 microphone wiring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260911-ux500-simple-sound-v1-2-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-2-6771ac714e82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:08:22 +0000
Message-Id: <20260910230822.812A41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AB8500 and AB8505 codec block exposes two digital audio
> interfaces. Define the codec as a one-cell sound DAI provider so
> generic sound cards can select either interface.
>=20
> The codec binding conversion also omitted the analog microphone type
> and bias-routing properties supported by the driver and documented by
> the old text binding. Restore them so boards can describe the codec
> wiring without schema warnings.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ux500-simp=
le-sound-v1-0-6771ac714e82@kernel.org?part=3D2

