Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1310E4534BB
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939975; cv=none; b=HJLUIQl0ypkPSaGxotUfdP7FTDTNhP7eO9LII6jYcAk189aajV7LOL+msYgvCEoZ5hd60fyDqyxJxv7XWIQ98NzfelkHkRVaNiH83dLRd1FApb1jseW6bDTVuL5wnNKrAbVSYfr8qxhMLsVQF3JvBScWlVJRXHacuGIKpTUGsYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939975; c=relaxed/simple;
	bh=wRkvO7zcW5wYDR6YKmUNWeAOhZD0uHEASllFcE71990=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aEnQIOjcSKflu5ZZonyalSkrQpwH0RM116bizK18KdIf0eU8JjR6rbi7NspkpxgRJpCukHlx+szHvpq1POsn6fj++BDkJBVI+3amkzF50tjwBCqMiv88t5/QlNDzELeFkmm3wHVoFtbsGgKucgNAhJYou9W2CZqCrwbBSEywJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S76ORsoT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S76ORsoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798C11F000FF;
	Fri,  2 Oct 2026 11:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939973;
	bh=wRkvO7zcW5wYDR6YKmUNWeAOhZD0uHEASllFcE71990=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S76ORsoTIRxiQda+BWhmsxNJuIF8boiJVMQ8l4cBpRlEXVgIdhs1NexCoozqOaTRa
	 Rzi23I6oED03nGcm55OKxBXhrelSrPit0Hhx2Ugd3v1rfh7h2hoLQzSx0SBDnWBIRw
	 VijIldlRCeYo7+VW0hknvoG51KpdvvFd7SXcj7yj2jWr7PmpSYffyQxkHLqmDLn8de
	 ptIv8bCGoEARyTFOLp6y767TsZSTMpKYDv7UX6DASbux/GVh/d2lLmhuH9fdT6jrEs
	 5wEa3uong/bJyvvqqSGDT8C/4F9UGWOrwWxlgsoPfv3FnuDjDoLSZpM1hf0VuXNzEj
	 vFD9XTRv39Cag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/9] mfd: cgbc: Add virtual I2C bus support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-7-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
 <20261002-cgbc-i2c-storage-devices-support-v4-7-eb42e0f1df59@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:19:33 +0000
Message-Id: <20261002111933.798C11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Internally the Board Controller has a virtual I2C bus with some virtual
> storage devices (EEPROM and RAM). So add a new I2C cell for this I2C
> virtual bus.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-cgbc-i2c-s=
torage-devices-support-v4-0-eb42e0f1df59@bootlin.com?part=3D7

