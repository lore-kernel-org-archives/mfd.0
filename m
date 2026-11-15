Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733679;
	b=U24Y/3RwwrGGl4s5qfhuNrtOoij4/aoD5YdxWHfiLt5x3Dg23ePZLmJWQfKdbinHpML7
	 pqBR3f0HhzMLB40Eanc86oHBaGVXeALzSf+7UFDKJbpy8dT1a5tE6Jb/YvsWoqtUH9Jrc
	 sw/GljnEz96qH9HI66it2j4dvFBfsMKGDnU7jWEIrrwirjJtvlyuLb85AC8WR5EIk8eng
	 BVTbILks2s+4bwyDe3whUIymfmcyAJGzuEwT6OniuwgEo6gmXMkBkhfXU7EYhXofGOmRd
	 Z/TxU78OX7/Iz5VvNt8DWLCSlCfo8X0XZvAyCxQcvbmpSMNSxXD/AcmJ/yxMzh91mIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733679;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=L/8ef7kQWYm4wYiXGn3Rxrsxo1V5vVX1K2HpT8ymzdo=;
	b=2XJ0MNYa+YSX3GbV0lbQtd14vS7JepabRLrqVae3kbij12t3oB2Lfekhw1EEIFtRxKVL
	 fB9XSwRgYPjVwK2J4TgNuvpguoHpJE4FwDl/JXdfuDT6pA3Hp+937BdwslD2YBOs4VqLB
	 +vvqceSCBnbsEkOVcuzB1XXXHGgzdOe3QIppcd8f1RW+pm/zKadkmytKwyaKwktpYKatB
	 7PnELn1mK5V1Ms7ZmkA7O+60zO9xGlJoVVLN1RQpQvP9TAnWWTVLuJr6E190tESs8GIiS
	 wFJimvmDcqRPf1jif1HgE72YZu7mRWiq41fzf2/dBDnn+0hvtftDrLAvgqoeeuPQ1gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahYFfA5X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BFE606A31D
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahYFfA5X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E071F000C4;
	Sun, 15 Nov 2026 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733678;
	bh=L/8ef7kQWYm4wYiXGn3Rxrsxo1V5vVX1K2HpT8ymzdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ahYFfA5XR+Wxe8nHoWTVzmOODSHZg+PQO/mcNiKQiA0YjOMS+kQ4KrIs6lFAhXu+4
	 QHHo6qxfgN7XQsDyKiEc1O3O8PiUfvc4/Xd0Rt/lJjLUjtBel6AK7z6N1n/JcavmN1
	 S8d+ffDn2S5flB9s6QaCf3FFBefW0e6Ookczze8li0ll78euuEFvHSYv4p3/J7+W3B
	 hiY5v3nHlPLTvVrV3l82RS/J+olaXHWWkxQze00W8EDG3H6Tph5IQcnISEc+1Ia3EX
	 aiKucr9uRvgwnWJSKS+mXz0EU3SPiAcC9Nc8KrSCZp/kytKojv3YkTtQMH2obwo+h/
	 wh7gHU35S5rMA==
Message-ID: <sashiko-outbox-215327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] mfd: max8907: Add restart handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115090147.95337-6-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
 <20261115090147.95337-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:07:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add restart handler to reset hardware properly on system reboot.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115090147.9533=
7-1-clamor95@gmail.com?part=3D5

