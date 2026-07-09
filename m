Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B8139A815
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617031; cv=none; b=uA84jBbBK0kFrMMpIeiDn4WKYuKSw5FeDJwzTQ8caRq4ZkRmtaHuaup4iNqu5UgaBXb08FSaV3GU3TrvDY+DGhIzWWV+jUIzHia+g22QJAmAvmYioT98CNcqwWH92oB9GXIqpQzmtVIciCD/fLMnXWt8J5iDcCFs5QLX+W/HIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617031; c=relaxed/simple;
	bh=Ci/6PAryveg2ovArtDHQ7264i5r1eey0060V4Ds7FVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xt05AIPj8TEXezqnCQhTtV3RZcZlI+iLW+xwS5MofpReRGZU1duqHs3dx3blS9b78wO9Q+6u4KGZLD4FEoiU+QMjJNVkg2jUUXq7fvLANoqZSWKwrlPDIx0EheoIokYF6BK5hUr/RUvw18yEiFWSC2IKO8Nzs2fES55mSSyQCFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TH6w8CQJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TH6w8CQJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D9D1F000E9;
	Thu,  9 Jul 2026 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617030;
	bh=H0sNDbo/onhdyCqQYxCVp0f/1cGTkKnACQ2Epg4AMeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TH6w8CQJDL0bZr5sZMKHgbjzzoADiBWzWuFzeBayJG6AsKZjtCYBiDH/WFfDvRD7B
	 AJcjycjeksVqcUfu1gxutg8/wpFF++zaENMH+o74jZWQ3KeEx9ix+Lqz4WnpBNpxqF
	 zTu0EJvjvtYhPjY5q7KUz821yL8y42vLLbL3njuXuzsskLHfUJ4LWe7eox8YPROtB8
	 vs0CLRrqehJZzeoH+KBNnIHwq+g9wYGLsJbgNG72TtjNGDUvIEW/CDd/efQaDgqdek
	 9qFXpNerK/+zmhpITTzEwYkcmHCkkynotGW1idieqxlMDCnIxlEx+JKwUpEE1vUev3
	 /pzUooGBpCXzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 23/23] mfd: Unify style of spi_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <a57cb7bbbb1199f8a80b73ee65c607f2c05c4ecc.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <a57cb7bbbb1199f8a80b73ee65c607f2c05c4ecc.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:10:29 +0000
Message-Id: <20260709171029.C5D9D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>=20
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>=20
> Adapt the offenders accordingly.
>=20
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D23

