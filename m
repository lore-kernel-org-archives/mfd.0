Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41377330328;
	Thu, 10 Sep 2026 23:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081750; cv=none; b=NgPX6AWWC01dcfumlSE7e/ShyWW+V8jaZDvXTVQfZ1sRT+HnewUIsu4sP6YFNa6L32zYKrUQDIsPIIgBAng72lWrSS+YgAn42MpAnlg7JYD4BmCfQ7fhi+bb5+ZdZnDVSN3HhOB6e5bXIiFftowQd5dNfSIZFKDkkbMt3T+waY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081750; c=relaxed/simple;
	bh=zbl3CVZbMaL64Ve3ltZcA8YTGYNWk+JOL8K7ju9+Qu4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KIEestYmrDiJQWzzSCHRqZIT8NX95Q5ornjKoNSupr4OK6g1/j/jJ7pZbYNxZWbHJZzf8ezAU8j7RnBiMNdf/IV2/M5cWZGz3QjxYUUS7KebinKP+QL1FgOp/Wh7SAqNzzgw7GMDSByq1Qt6U9BrXNmgFWjrldGh5v2c6l6XCrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ait+nNkP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ait+nNkP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7083A1F000FF;
	Thu, 10 Sep 2026 23:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081748;
	bh=zbl3CVZbMaL64Ve3ltZcA8YTGYNWk+JOL8K7ju9+Qu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ait+nNkP9S1pSizfGUHKi0Z5puS09BbihhBHtU6SUVm0330SYAbeFNv4R+zpwCx1s
	 56yJrYtNEXjdroWDyX0xyjOeQjQFpv36UlKN1jOD5QuQoQOt0SPnRo2ibMAJ05phSt
	 rLPmQMyJU/jIYBgX0wcNZhdBGzl/SiZ5R51aBQ/kFSmFD9qod358EVWqY9r/qtgEy2
	 27EpQbYyaHAjqBCqzA+lv9pQAFrcUKYEU8Jm1l7SHEBmwMpxZ9BxtZNXEdh6Op7mQY
	 FHbxHSu3YkbTVzluz3x32tUaPqaKJCzVL9geXRGZaknPkGVddu290y/+kvDYQrjurz
	 QSC/G5B00Z/HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 9/9] ARM: config: u8500: Enable the simple audio card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260911-ux500-simple-sound-v1-9-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-9-6771ac714e82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:09:08 +0000
Message-Id: <20260910230908.7083A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Replace the removed MOP500 machine-driver option with the generic simple
> audio card used by the new Ux500 device tree description.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ux500-simp=
le-sound-v1-0-6771ac714e82@kernel.org?part=3D9

