Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828196;
	b=3brBfjYn7xSD472RW9eKKL0kRxdFLFoGti3ARBEseXS4nNRWenqvyGM+ZPhf5ITTgDXI
	 Ue3X8uoHwXfrnKCEYybM94/iY6o2FtAJMIZwasclregDFYtHbAUHroDewzFFyhTbOn7FM
	 4QULahTtAhhF29OEHX7xaXYDEPq+SPwhxg6A+5VT4V3GR8AVSQuuB+l8lKRKUEZMvoo5P
	 tfRmgQ6J/GMgvRGe//HaSRg+/5JHXwTgUjUbbjODi7JGb1Bg7B3ch2zjP8DYrDAnubc/N
	 J7GPbfDxFHjLbGV4ANFww+BTb9kLdZaZFtkTKG4BdhgLDbQ4XWbtv7XeMT+0EQEuW5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828196;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+tyxtiuXgtVA8MPA0RY3xZZBEoNjhHVwvJ77vXsjScU=;
	b=ZUGh7oOj5z3mmcMqbaIcSt5I1K4PFgS3M4ZtKdKb5XhFH6RWbdLLOl6oqmnOs66+s7s4
	 Ie7+pplYg6eGlzjgtsQnLiZ6M5O3LusEdccxyuN6t6hh4P3Ll1aLNMIZCo09V/SRvJ3BR
	 KBJqYJKqNLnSmgynMpvs+6Dgno0ZCPr9sXVn8gia8IVL4gJ4tWIHpHnnU/7oJY0lT5JBv
	 bRQxl+00h5QohWNzgfiasz/lmX+u6lX70dXbrr9FUj/nurThF7oIMF1XX+EdzIIeKxQQy
	 4y7mPxQJqos4ljkIum/SowkSdLfEQVNU8+GEkXTT+tKlvqLEqYz+4TNbkU6e7s67Evw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VsiRRcrh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78AF606A338
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VsiRRcrh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BAB1F000C4;
	Mon, 16 Nov 2026 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828195;
	bh=+tyxtiuXgtVA8MPA0RY3xZZBEoNjhHVwvJ77vXsjScU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VsiRRcrh72eVGDqPBeBZxFdyE+rHzAbAD5mVooR+nRiltt8xUfsNeG/+oNr5RstGd
	 3FXHLRmvuY/jwFNTP3ZN72EjQolxebPrf8z70kap1hb4UGiJS0jhV5S/op04UaJRA5
	 4dTdGmL7vyvMkPOHDXXYw2hquHOJeOLSGlcgm2EFrQtBGqnBhr2hd8quTIG1rtdncj
	 w1yQucX3lJ8Nh1p7cYZtnNz7COkJoY+mZnYT4NfmNdwUBforcZiZsr+rZiSp9iWc7X
	 GHNehJN5q96hbtRjZWd4JQOO960oYQNMWu5Wg7WH0LAwwFTynds02edXY32yUSQ1TX
	 ioD4+U2WLA3ZA==
Message-ID: <sashiko-outbox-216909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] soundwire: Add a helper function to indicate a
 device will detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116110913.3555209-2-ckeepax@opensource.cirrus.com>
References: <20261116110913.3555209-1-ckeepax@opensource.cirrus.com>
 <20261116110913.3555209-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:23:15 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> SoundWire devices will sometimes need to reset themselves,
> typical times might include when taking over the device to ensure
> a consistent state or after downloading a firmware update to boot
> into the new version. Often such a reset will also result in the
> device detaching from the SoundWire bus, in this case the driver
> has to be careful. Naively calling sdw_slave_wait_for_init()
> after doing the reset could immediately succeed if the bus hasn't
> seen the detach yet, causing the driver to proceed attempting
> to communicate with the device whilst it is detached.
>=20
> Add a helper function that a driver can call to indicate it is
> about to initiate an action that will cause the device to detach
> from the bus. This will reinit the completions in the peripheral
> for device attach, ensuring that the next sdw_slave_wait_for_init()
> will not complete before the detach has been seen by the core.
>=20
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116110913.3555=
209-1-ckeepax@opensource.cirrus.com?part=3D1

