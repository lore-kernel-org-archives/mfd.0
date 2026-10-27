Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114934;
	b=xb3OkY6161oGGB/A2y0DOTr3gZTTeUvF+FZjUaJIndrCuDya54I6JtVk6dgg79ezB0nF
	 Zqov9QMOwkavl9ZN03rh41BI0hTwRCMBsbr9lNLb8aSuRdcz2bruYxajuvoHn37JCqwSw
	 j04YetLox1rdYUafovS0HNboQACVn7ydOMTBzda/mKC2a/eIBH0azVaRZWZXkligF6oXM
	 lUzQH5J3DgKsjP02zrlpO3iqwzP21u3+IUBzwXUvOhNOw7YY7WhWhixpHDnIUpv3eWoXc
	 0qWMzGNKb3DNnmMx6bc9JpeRD8sPA7D1lDsZAeC0fQvjPprkIHWgptc/OemH7YTbD5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114934;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oRYdV789Oem4A/xmmzxeQ1hIGU1bnBELtDkhLItwq4U=;
	b=3pScj4CZkgrEnsounVjePIV0uFyaLOJwMgRzfS06hWcGMiWxkN1MS712oQynRiogcMKs
	 myc4R1H42lBha486V0gbGRneZtewKXtD5/n5VS/nBHDj4dj3e9mciXfGqatsfRZN+1d4y
	 A2jtJw0mOf51m0KcOX+jpli5LHpMxJFLuONWB7opLzjBV6c0bT8L3K5AA+5HpO8aw0Zq6
	 /93ClkLXTl8vLw6qr9Tv7tV3cDIBRmwtwoFQueZFCk7ymnMYG9GUk7KvBBQ+iEpOQ5w4a
	 FrGhwQx+iVpjvDY/3uWPQ0VrzWu8sWjIx5MD1Ddc5WEeL95NSwMx84wm9uvhUUGSb0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQVPryK7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3134606A323
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQVPryK7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFD71F013C2;
	Tue, 27 Oct 2026 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114933;
	bh=oRYdV789Oem4A/xmmzxeQ1hIGU1bnBELtDkhLItwq4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QQVPryK7B428kvmvO79ISM84KbsfRbr4a8H6NJWV7B9qd13XBCj957nKMt4Bef0nv
	 JQBK5+tYPThDDJUqY2lTAcXE21V+6NhE23QFNCTbMmBgcjcDVivf5e7f2+swYUyJXn
	 bPXLbckNY7XRd4Vi6VruwztxwmSnUATlJOS02BKUWHGEd6dMiluKMV/5r3EISy6swS
	 5oku7hLehqF2mCciGf0nCtqTP2/to30stzDcbMIhkbRsNIQ3Zkn0PEreMjk+kLP76T
	 TjH8WeBddmUNUC0/koKREN3nw+vZxYLkmIQ9VphVfcXoeW7cptjsYs1a5SfG4twwT8
	 1fMtDEo2hPl5Q==
Message-ID: <sashiko-outbox-186838@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] mfd: tps65910: Use
 devm_register_power_off_handler()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027152423.194794-2-clamor95@gmail.com>
References: <20261027152423.194794-1-clamor95@gmail.com>
 <20261027152423.194794-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:28:53 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Dmitry Osipenko <digetx@gmail.com>
>=20
> Use devm_register_power_off_handler() that replaces global pm_power_off
> variable and allows to register multiple power-off handlers.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027152423.1947=
94-1-clamor95@gmail.com?part=3D1

