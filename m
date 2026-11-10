Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347955;
	b=erzHPsM8hPApiJVnFtbGZxQoDlkCTpvofeC0HuNU/WDCIL1fiHEs38UyuDCtvqtPAhCO
	 zA19ziWbJGqKCgBXn85mg0dIGQHN0vMqUhVzmpLR+JPwP3UPIpgf7nsauzuaLF0fPkzCj
	 AEhgo6NhDhfm+YEFImK00y2fFNaN+vxHD6DaYL9bMCZytMkz1Iain8zGo7QJu9CbaT1LU
	 jYGkhxfp4953rHv/sWD6V7P27BquXoKzeRJk7AFvA+JUDt1UNjvH1DR8wclXdwtKYkS39
	 ZWtXBTfwARTB/HyBxjqHHakYyFNiYEkG7SnmnB+zuOkpsRn92kKrBpaUWg1G0NTDepw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347955;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RZ737bis44A8JGeK9OjSSymwghVd84Fo6ulBYjnmKME=;
	b=fcnhHGtB4YDkmcTCEAH5rDT/HuPCOVajeuw/wytClgBIgQSlW6GBrdpXzIn0QrjYhaB6
	 mWfie1BWCKhgnbtntADYivtef9XEZ8DNwj1JapV8gBvLxLKbKh4/hGl7F1JKSEw1wgiC1
	 g0/+fFMZVgbdl5ZaMLFC7zwFw5LroEzUfljn4SVaKwK+d9aZwTJ+ftNPHC1oh7H4LT8Re
	 tvcqs6WV+0ESpxI1hHN5hm36W+JeLK5vpIHG0hgugcJcllCigyR3GYZ4XEzseyCW2h86N
	 D1wyboV1ORB06U5VE+YfMD0+iuNE2v8NCNmNgg8tSW8e8pDme3I7NJRcyR2WrJMI/Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQWG0ROW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E48C606C987
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQWG0ROW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483BD1F008A1;
	Tue, 10 Nov 2026 21:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347955;
	bh=RZ737bis44A8JGeK9OjSSymwghVd84Fo6ulBYjnmKME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TQWG0ROWCbbNc6NeqleP4mNeyuty1X3LhXcgzqAAqhgR4Hh75HhWm7/0PAcmsZfV9
	 rcMauvAk4S3dG6RRV/6gYQymfOubIsdQiNQG6sbFrK6YRSpyQr1o1JAQ7BwkVLYstr
	 jINt1cNtQhlSrS5VchNmNfCIgqpjLs1b3UJ3aKtkKdOGMhoDoYathnjd6oAUkGdrod
	 7fxFZUm93/kaAel0c5tTea8IqjZ0qCYOLWoXkGGA3AAlHZ+JZQfr0YIKveAaaXgQ84
	 WS6S3BjU3vp5q6cuKhTipn1EHUkCoNgklHcg4rLI2NFz4FYvvoXWdexK/3tFxsLOz/
	 VVwlWnpmEMwvA==
Message-ID: <sashiko-outbox-207791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/20] mfd: Drop unused assignment of
 platform_device_id driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:59:14 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The drivers explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop these
> unused assignments
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D9

