Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD97356A38;
	Thu, 10 Sep 2026 23:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082246; cv=none; b=ZHJduafg5v0Eap0ImZ2FRh8ZcACoMPWMdXSySjVq6d+RUw7dAUKKs9l23F0wQRYoWsb7MShN9paYVRMWKl1FWrgoYD4H9qXo7iYNZkFNtaaECbxrk4SxGjU4We5Bcfu+TJRM01OBbTAlMY63TghD2JdNLsT8WxS4OjjxFkW/Dio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082246; c=relaxed/simple;
	bh=nLazmiPTtEqClSiXRESgjF0qNsRWfam/pBD6mnfhBY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gYZx+LY2sleUAZXBmxe0rpmHVXQ2BhZNwlXCo60hs7w/b/GeRqeFTFN9kRfR0s5/+at+Gn9L13vQOVjCEarDylT9JiBTqw4c4nLCoKpsGPsB8XJCb/KSyPFTM7ImjVu1839ilr9duT/7Qd1fESoMqWqdLZIhst7Myi/1qT4+ZUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eV2F4zUg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eV2F4zUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F45A1F000FF;
	Thu, 10 Sep 2026 23:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789082245;
	bh=nLazmiPTtEqClSiXRESgjF0qNsRWfam/pBD6mnfhBY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eV2F4zUgAAnttBb+qksFWz9W8hO0uwUlsRTsuQaM9ZNIBOdm4OAs++10OEGhZ2/88
	 Nt/9O4+Xxfvdd3mKQnB2/bj3BXWEBBe6R6wEEC3yU6G3AjSARKoyMZJSOt7/ief38P
	 IIzi7vhaXyt0Z/FC4wl+N9oX0vZYd6dBSMwOsInDEZ60up4ntVdv3tfM5i+eVln+uz
	 Rtm3n6JV569srtoHYGJCW/F1Hx+mb5YGk+BjZvA+J84B2M/bHS3lL6CgFO1QhUOuP/
	 nNKaCZQM3w8dg/v+b57FryjieWVdTT3gDm3C4prd5c6zz0EaP86cXPSRJyNzxgXWBg
	 JRfQg2QAgnMyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] ASoC: ab8500: Skip digital microphone support on
 AB8505
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-ux500-simple-sound-v1-4-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-4-6771ac714e82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:17:24 +0000
Message-Id: <20260910231724.9F45A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AB8505 does not have the digital microphone interface, its six
> input pins or the VDMIC regulator found in AB8500. The shared codec
> driver nevertheless creates the entire AB8500 DMIC DAPM graph. When an
> AB8505 sound card binds, the regulator widget requests the nonexistent
> V-DMIC supply and falls back to a dummy regulator.
>=20
> Split the digital microphone widgets and routes from the common codec
> graph and add them only when the parent MFD is an actual AB8500. This
> also removes the DMIC4-only AD_OUT4 path from AB8505.
>=20
> Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ux500-simp=
le-sound-v1-0-6771ac714e82@kernel.org?part=3D4

