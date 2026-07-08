Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993441F5437
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510044; cv=none; b=RHvWdgYhrM8wvBw7r53E9EtBH4tVng64xC8hJF5++eqxz/x2ylvsEDS7Fzg4WjgtRDHKQvqAGpoZzzDQ0+TbV/Lclt6dzZDLb6q6yXGemLs3SYspU8tycfaculBAmA1R0kIzXuhJWCWz52YAcw+GVx6NRVVhmlo1o0h3hN4Y2GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510044; c=relaxed/simple;
	bh=F1HREasQgG/RGWoMAGBkIxwpcjWHU546P6khg5h4GL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mbsIWCnC1IiHCmPvKNODMKdJZKAAP4KUHgDGvp91ldoZIHFHhnIW3F2A6H0equFHgpLdFaTo5aasP53Kd0qGObnbxyc4O9ui3MQ5FwQDDrzsDzANUl9J5eBQzsH0Xxol+C82FYT9L1i73sMaKk5BthW6pnM3b4c2b28TNn4UPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVKhdXxx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVKhdXxx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080911F000E9;
	Wed,  8 Jul 2026 11:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510043;
	bh=F1HREasQgG/RGWoMAGBkIxwpcjWHU546P6khg5h4GL4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gVKhdXxxoTt+qajikwZowR7QtnNI6Cdkcu8zSe5qWAFWOk603BaFJbI6jvaJeSjpZ
	 YmLOqfUbtvzGI9OOxpyAaA2d/c8dshEzLiTrfcJqZbuPDIbM/Trt/R5bmym7iAcaOm
	 E2UryIVj/SMbYpMYpknO3++zNuekTrTAbGiI+GZvVcsbU3lrCYTWDhBUlGk90RBrpV
	 Q8w0iX5hfMfv0s3KthKgXQIDO6BvpZa0xl5OpOnDE1O3jnQ60XW5nEpJrAjx353QxR
	 HGJnirmC4qJNzhTVtqGR1wNuCpXQywRSsrJRGaSTR6x1RqhVDuNSUDTovy8KOhdPK8
	 1rFCrQ0y0hnig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/23] mfd: Use PCI_DEVICE* macros to initialize
 pci_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <afa9a60627dcc211c8d975c6a90708d421ead8e5.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <afa9a60627dcc211c8d975c6a90708d421ead8e5.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:27:22 +0000
Message-Id: <20260708112723.080911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Non-standard commit message prefix omitting the driver name.
--

--- Patch [15]: [PATCH v2 15/23] mfd: Use PCI_DEVICE* macros to initialize =
pci_device_id arrays ---
commit 01daeb728dc1ab5baf28174c28473f068ecb03ae
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays

pci_device_id entries are usually initialized using these PCI_DEVICE*
macros. Adapt to this more usual style.

> mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays

[Severity: Low]
This isn't a bug, but does this commit message subject violate the MFD
subsystem guidelines? The guidelines require the prefix to follow the format
"mfd: <Driver>: <Capitalized description>". The driver name appears to be
missing from the subject line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D15
