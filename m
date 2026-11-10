Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348061;
	b=QxMJcGsr1AiYr/GN8EHAsYPS+3m8R/oqGBEtIne4dibFEBA+mNdYhKFh93pc2y+nJN2f
	 NUGYUD/UhTWqJ8PY8eoxqoUShCouAgLC1kAxcxn7og+iSRu48CZCq8SolDeVFEjkKHK23
	 ooD4T2IzCGlGU1HVFJVIoJahRENntvOCOZRLobvwbROwlkUxZtY7Yh+trfh6T3D/m1S77
	 8UTz/VlHjnN+y5fTHvdcTPWRz4apqunbqhQZCuoWPvyGIv1eDFSYjeKs7UeUn5yAcnxHT
	 4FHBzHmUqzk6guV7F4kUiOxnRzTmS2X5VugMNdmrjUhHYIdUFujxc+xo3UVBNiM7QJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348061;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qNMHSYjtsZe3hNFncAG8QVquWtWt5/ePfecvCb+xkzg=;
	b=tO9jMDClTqX+j8g6qysbeWvjclNoPgPya4Mv6Fh3lWtotjdPknHGhSQzvFs05SXBFwju
	 IWpZw4RffHRfPTD+1Moz/SgYHskLwG5lXWWBrw5LxcOZE8EKfQIYZ5BMe63Dy9Yif5g2Z
	 Qn0M2WhF54vBiko0j+MF/vvAI0j3TjtM+df2mlJLT5nMGAjkqYBzK0L3vxsQ8uXJzHsYC
	 5LMw4sTNCKeOvNy8uJNVnaSJLgQyeszO66w6DczBvqAY0U/CcFROH3EvSSfnooROBFGQ5
	 imwFPy5Xo/5hccgQkIgX6wOjQbnsMfYNQ829Ch924fttDzURfpNpq3fL0iUKM3EjFtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XxI75Kvd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20360A2616
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XxI75Kvd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5DE1F00901;
	Tue, 10 Nov 2026 22:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348060;
	bh=qNMHSYjtsZe3hNFncAG8QVquWtWt5/ePfecvCb+xkzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XxI75KvdwEyIvCOrp18aEZfeUbjd0pkAnPlXKutjhqLtVA5pohA9DrN/rGRTlqGJz
	 wUgEPClrNPvb64v5ScJ1iFmx/0crP8m0WYRmq/v05EUD9etAdA3LoIHZylEi9AyfAX
	 3EEyYscr0Zsvi2I9pdANa2bF7XjPIFdroaDtTmt0RYYi7HKjA69V/bC1Ann09WtUkC
	 YEc4kT+/RhQ7S2+OMHE//BhhQlqhwkwZdYTFnxH+006ekQ6kkyCt8nlSg+uCFzYLnM
	 zKFW+78Y0vmzgcRuSsZi/ogn7DsmdAlstHiOcf+vqBocZ6JibQgWCsocG5v8M4jvNO
	 MpfQ5YExdWBnw==
Message-ID: <sashiko-outbox-207805@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 14/20] mfd: Use PCI_DEVICE* macros to initialize
 pci_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <416bd01a3b26dccb675614634f3150175b754bef.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <416bd01a3b26dccb675614634f3150175b754bef.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:01:00 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> pci_device_id entries are usually initialized using these PCI_DEVICE*
> macros. Adapt to this more usual style.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D14

