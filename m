Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E92E440633;
	Sat, 26 Sep 2026 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426715; cv=none; b=Ps+1VTzFlEl9vg/uPuQMicIfEeIoKuUZ0jI+HotmYidnJ79Yhg9UjHv4ClKz4pjRyq8uvoOf3vYHc7pWORntlGedBuZh0fNNeRa9131m0/HSaJGh2zwsUgw9ffSif1OXrVTVgpk7iDeuHCsfxQW+DvoWVbrSd5u9h6qhucH38o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426715; c=relaxed/simple;
	bh=1BD7EqPW8JlqINMKnrNozOY9/ZfltOcTAbu28qXQk7A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qPgqUEhVvEbjKLuTXZNlftjX48V4Erqle3M5DzpF4hTz3ehPotU4eTteHDZ/tnihjIv9UA/EaJRt0zzmHzAX2zFEXASQZwrHcZzVtsaA4whR0AD291VT9P1WeJvTrJUg4LC5wi8vfV9ClPQOvKSUGn4L6qxkCV97d1/55GUmxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hgn98W1A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hgn98W1A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA021F000FF;
	Sat, 26 Sep 2026 12:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426708;
	bh=1BD7EqPW8JlqINMKnrNozOY9/ZfltOcTAbu28qXQk7A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hgn98W1Aioesfb30drgZKZxBH+VjfT4g4DndfNXj/PD3tIhKt9LGpZo7O6sItQj+4
	 MhKEhImnNvQEEcVHIhHnBGiJy3qcdIDPW+wc1Ttd5rwwc+1XehTamYorO3ez2sSM9C
	 6cnhvxo6Gv0drlAs4YxvfLY608BnyIM5xGvpGBVGrhp5E8fSDAYYbBp8iKxn/0PMfc
	 rsRSCxV/azim0qvcM2Xmj+1NsDrZF3d0jvk5wlPNd2q70oJ4gMRWa7iw3kSocPgMDs
	 3ahCLF9tUTcqFwcJUOF5SSx2ktSqgcCnDZVHwxSUX0BCVvHGM4ZbNBJ+ge0h1BARvF
	 3Mcl4UPGB/MSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 07/12] arm64: dts: qcom: pm660: Add USB Type-C port
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:45:07 +0000
Message-Id: <20260926124507.9AA021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Alexey Minnekhanov <alexeymin@minlexx.ru>
>=20
> Add the PM660 Type-C port controller and PD PHY device node.
>=20
> As on PMI8998, the Type-C CC logic is part of the charger's USBIN
> peripheral at 0x1300, the PD PHY is at 0x1700. The node uses the
> 'type-c-change' interrupt from the USBIN peripheral for CC state
> notifications, plus the 8 PD PHY interrupts, including fr-swap.
>=20
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
>=20
> Assisted-by: LLM
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D7

