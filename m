Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3291A48BD35
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525263; cv=none; b=Kc3qhACkyTjpLXY0SxdtQ1f565c51Olsh2wRU+MdhULIp2LsInJoHAkTK8sHtymX4LR/9jIOE3cGxsM0vbGb/c61yI1wv5mKbgSh9vLpY+B4lv9DsE4WB4myCjTA1nvKdDYjbpAZe/9q+XCPeMEIFM6vu9K+TWsky4SC/DJyKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525263; c=relaxed/simple;
	bh=27s/JDdDT/uuQIrmPaIOBmO6cD/j8MQi22b30bPAPZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WeJeunWSkpp7Hi2YYj7Hn+ct7zUhy2NtHm+hrSH9IxC8ZsSU9kaaLlSnoFm6dWnFA+Wqdz19/asZNIqLDM+iRMjTGHT8BOFVoPyUxjCeltLu361+Qzd0GxjFMNA19lZdI8XloBVO0+H+AzeFe7R8mz3KzBGiEYWxNlh6Mn/XP/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLr3ckBu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLr3ckBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49941F00A3D;
	Fri,  4 Sep 2026 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788525262;
	bh=27s/JDdDT/uuQIrmPaIOBmO6cD/j8MQi22b30bPAPZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lLr3ckBu+Q8UWo7/IcI3jFGGEChOu3ap+FuOdStP0vKEfCIZ6k1aTaOLpiOIKgcK3
	 9sgrDcDlpZW+bRlT8V7DqGFJspUaPUo0zT1MSMrcrpEDrdMKBMdJmSi5m3KDlw44aK
	 clq1V3M9m5wFoojVbngdwgcGpUKYtci8qiGlKS1/p2zGh+QY6P5hvjHY0HwjmOa0r+
	 R9yCdf1GHPkGTGQaQ3POolxDm0aHf0y+pUrZfkWP9b3i5Ix4xn/tahIeI585Hp52Ab
	 JHKm2ZeOz0isrqe9G8IbqJKqnC8Dxm6ucIhUcrEHz8y5mHdF3wW+CqxSpBExYlqlcN
	 JF6N0P1Xlm/CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: fix typo "interupts" in comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260904123207.36203-1-hemanth.selam@gmail.com>
References: <20260904123207.36203-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:34:21 +0000
Message-Id: <20260904123421.D49941F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message violates MFD subsystem guidelines by omitting th=
e driver name in the prefix and failing to capitalize the description.
--

commit b8afad77af5e37cd2b9a16c47eaed637e80e0bd4
Author: Hemanth Selam <hemanth.selam@gmail.com>

mfd: fix typo "interupts" in comment

This commit corrects a typo ("interupts" to "interrupts") in the
ab8500-core driver comments based on checkpatch recommendations.

> mfd: fix typo "interupts" in comment

[Severity: Low]
Does this commit message subject follow the MFD subsystem formatting
guidelines?

The MFD subsystem conventions specify that the prefix format should include
the driver name and use a capitalized description, formatted as
"mfd: <Driver>: <Capitalized description>".

Could this be updated to something like "mfd: ab8500-core: Fix typo in
comment" to match the expected subsystem format?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904123207.3620=
3-1-hemanth.selam@gmail.com?part=3D1
