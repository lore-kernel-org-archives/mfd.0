Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186593BFAEB
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409398; cv=none; b=fvYJIz8dY+NnL49hzQxEjiyW3/kqcsR1UFqt7k20rwzf05rvCUf/xuz6Wa1cNcDG4qCpNig8Ag+xAGh0xsEPvSzklac+Gu6YyKlEfh9u/3eyNlLau7rMpNKFzR8taQCNWfry+WHvP6d3bdbLTxxKA8kfyysyQdIw8ZQBeCqVdJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409398; c=relaxed/simple;
	bh=8IaBRsocGgq8fgEPZOG/b2MM5oFsc8ToyCoi8gHftwg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sTaaztG0WS6FFXRLu7Daa12qBQvgOa5+K06e+FiX4OVzwNSoLIgVFoPmxSR0eq12aSldTEQUf+GoiLnfcNd6b/SY5dkAu/aO3CiCjLF2brQ6ZqrPI6UVZ2NpCkkrfvpSTdHLE7aS3tGCxz30C1f08BHxmAtWvTK8pp4a/i5mQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5GWPNj1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5GWPNj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963F11F000C4;
	Mon, 19 Oct 2026 11:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792409396;
	bh=8IaBRsocGgq8fgEPZOG/b2MM5oFsc8ToyCoi8gHftwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5GWPNj16xuPrR5Qm+S9XtSfaeEZT3evaEHAY+Gv6RvCQcfYzIeQ05W+M4sHF73pd
	 uIMRjjh58I2hvapvnxkcDRFt8faBI4Aq6RqiYzX2MgjDh2q9kIaCK4T9n6mSsVBWJy
	 k4HIdTVRJJlaqzoTcRKZxx21yekIK/DsiinIJESS6dTO2cDQ5A545q82hCd76qY9Wo
	 3pggcaudNmDmhJ/rIj5jcby7LwuijzT11VUTV1J+ushGtu3Bruij62u+Gnc14wGPoR
	 H/yN4oN6fla6GIgphkl9DrSmgC6mi7yekYAOJi2xFIRTGQvFlMJJRbHlvLUHk7TD//
	 FD2Nnq6U+D+/Q==
Message-ID: <sashiko-outbox-177039@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8150-hdk: add display card
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:29:56 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The SM8150 HDK can be fitted with a display card carrying a Truly
> NT36850 WQHD dual-DSI panel. It uses the PM8150L WLED for the backlight
> and LCDB for the bias rails, and it is mutually exclusive with the
> on-board LT9611 HDMI bridge.
>=20
> Only two of the three WLED strings are connected on the card: the
> backlight stays dark and the boost runs into the overvoltage limit if
> only the third string is driven.
>=20
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-sm8150-dis=
play-card-v2-0-86c05068efc5@oss.qualcomm.com?part=3D8

