Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72CA435A95
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509768; cv=none; b=Zb5oR92+Z9oST2aur6BuQeGEFfH9bGaqtFCBEoGsKPs0YAw583YE5Z2kKB9wcs+Yt8X32Zcni54aev+dkOUl0xCzkp5YCIX+ejMQS2xQLEDmET3i3KOJ6rSeXlTGyimMIIvuLZL9R6kxj1rcS2FpVW+HzqKRFvVk8XMjfPONVQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509768; c=relaxed/simple;
	bh=4BaSXsPzEudC/Zp4xSyMBJNseEARKQn9r/VRcNA32g0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hoiZq8iT91niYVYoNE2cLBorjo99XxUzfO/eHF44cUFkftgcwp/LW3BBWBzuP7ku3WDxPZGpccInCTzYV/fDerxgKOFosmwXvT9SoYGuIPFDN8B98CkvTWtfIcWtCXPZkKbJXHykbQzhmgm3/FNtwRQVR4ewzfi6/LFZ2QEaQBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPsSHywP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPsSHywP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421C21F00A3A;
	Wed,  8 Jul 2026 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509767;
	bh=4BaSXsPzEudC/Zp4xSyMBJNseEARKQn9r/VRcNA32g0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aPsSHywPeYCOCMM4ESg57oDuy8ugPpPGfUOAW4vKcsgWZxGyidqVmIZ5h8QzWPMAF
	 fiY85HHYFzBBj6+Rj5BMHSrxYeMcRrbjoeM4JO2bJQ7Je010i5oG8E0XDe0BFYdiim
	 fm3uwop0fUlgjZs4wufX7bV6kwJ3liQStMIYIZozlHMeirBp56pVEe2PeQpDgGUFkb
	 5XMcV4d7PoHlCrgfM8ucjyfMP9+HcAbzDfDcins9nt3IoK2ICDyJ3C2GyvfdZGli9U
	 RZ19MxRMTL+BWZoFatMBbej9Ae1vjRpYMAliFnR7fZUgjr5SxsZlLzGY6yeASiZNWs
	 bxAqWomc/6vbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/23] mfd: Drop unused assignment of spi_device_id
 driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <9569d4523b0d87d2249a087e760f3eaba231b4d9.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <9569d4523b0d87d2249a087e760f3eaba231b4d9.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:22:46 +0000
Message-Id: <20260708112247.421C21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The drivers explicitly set the .driver_data member of struct
> spi_device_id to zero without relying on that value. Drop these unused
> assignments.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D10

