Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807817;
	b=wk55cLESTPWks6+mBcmaOEtibjOOCWRy9+OXycPbq2C8pf2L6OSeDzZjT+vDrRO0M/Xx
	 JFqaJfoQYrD3kn0lEGHu4u1JehrvhtFsiRZX0SkwF/wd1ZW7Wnc1YwaARZugpQJsqflMI
	 SWXlmnzJLX9/qv+j0K3lW3jjGXK+UWdWGbU24nNAq7Wmru1LUerj6C8F+KLNRlEuLFBdV
	 Z6uVDxaGtEmwIHNKePz/DLPgFAQO0sPqu6ylYw9pMt4NFZKInlaDlgM3T/6nrdS/tZdqX
	 3Ql9Po/1lVb9VJGoZ1kRjomH7qlLI9CdODaZVenlZGNMmtIPhZ7XeIUbsymTog5KFiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807817;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=44m3RSVTyckXdEPYy8vppUKpjCAgn68etNAKHTfBbSg=;
	b=xub8FPoJxEoCbG0WlFjNsLxlgw5CymBJBQ1dYQxNb0bxlF8IgDRvy9rn2zYo0pfauyHi
	 GI9Ts7JWNjWjHhBLcB9ufel7Uk7+G0iomB2N3MXgY7Q7LlN9njVUvaNqd85PBlBgHwzmB
	 iAP29NGIKSiOHhoZTo05GCr3TIdInKcbeH7OdjDQ2jFtSLQmZsbW+/nHFOCZnYhjNbIna
	 GrPDWr2iB3OyHFkYX0rW5c1oowG4Kck40JUTdEj/bePN/wRjLKvDqNVvjPh+u5uhKsr3c
	 PkwBqYTDGmNMHJn6NMLB37MqBr8AJPYqrHsChj3YSWhbJhCaE6H5KsQpPwgP0nX7MVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWOvAg6a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FB606A321
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWOvAg6a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B7D1F0089A;
	Fri, 27 Nov 2026 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795807816;
	bh=44m3RSVTyckXdEPYy8vppUKpjCAgn68etNAKHTfBbSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aWOvAg6agcLamiiJJMnPKSmj7mwFjMmbYbObmQCpux01cbFd5AZ3DeoZsyAGDCboC
	 Fbpuvy3cy+Q8WKsRCsmoWvvN3++pxsOqktai1N0kTr6F8h51vu31MhUFPUXRIg8heg
	 JP1gcwsIt4U2DuuNj9I7IjTVowCn7O9H932MdDZqaVbsllcZibxZyGK5J1FIYAbfwO
	 sDEqRs7PBNAFUVeVXPgulwlJQ2E17qdN/LALswx/epgxti3C5gFOvUij1x17LHLH3Q
	 AYbic8zgIh+T2z6C/gYw1fkaOVeMYRZvDaZ1vkxfEvj9LdHrKw6QrClkVAPnaC4kmB
	 QqQrMEeksplDw==
Message-ID: <sashiko-outbox-238160@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/6] power: supply: max77759: UAF, charger ABI, input
 limit, and supplier fixes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
References: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 19:30:15 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has finished reviewing this 6-patch series:

- Patches 1-5: no issues found.
- Patch 6 ("power: supply: max77759: follow the supplier from DT"): 1
  potential issue (1 Medium)

A detailed review has been sent as a separate reply to patch 6.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-max77759-c=
harger-fixes-v1-0-b364a0862d72@linaro.org
