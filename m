Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD61632DD
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 22:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789510737; cv=none; b=a2NsPLJlrTC5SFTVEzjkUAL2NbUqSno2/CrK7ov6W63HddGKoKGn3KKe+8WW55OBmqASKddyWJUXG7VbDPnUlgiYLsve8U2cgH8Cph9x4y1ipAF3qSevvaEZfQMdWW/nT8T0oUIJcILjyUxDSd2I24H69tKdMhy9YXuGKhDAzx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789510737; c=relaxed/simple;
	bh=B+dtM0AM+t/yT9gEBAszP943/fTjUpS3ioLT9xHVMEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ejLBhdq4fj6j6ne7T2M+ysg9S10qanNs1bV8/pjmyCMY+tlWDN80k7WEer+fe2NQwrRv6HZ9a6n3/qlweojUri/iOiw3gOt4U3E0dm2bKifGZ+epxDd7k7jSUJWju8fSNKG7T/7JNIgup2YvKRdOGFofmM15Ep+lGJoAXB8YEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVc1iRTM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVc1iRTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB021F000FF;
	Tue, 15 Sep 2026 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789510736;
	bh=B+dtM0AM+t/yT9gEBAszP943/fTjUpS3ioLT9xHVMEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AVc1iRTMl4zkpWym7N548SnxOyISkTqHsZIOs8x+cvGK+uCXdxiC+gzmxKn7Zs4W1
	 88Ms3bdrywS75SO6Bd1yvFTrzisVT4HvlA8yK6hazz2BXP8+Yur5BvKMSf9VzVWPq0
	 LS3TeKioBMs2oVzd2wES1ncJt1EYj8fnVLj/XSN5ECMmv1/wcNO5TkQGz43a6k4QkC
	 pE46WTH49trGzioRHaDqV+ZC0OfU15t1b4Ule5iI/x2tCjMmr51Oh6KvFPt+sByDe6
	 nRY18YEonQUaRFl9mP0hg/zwX/9XvGTtJw4RybqYuNxOQtA8hQMsI7fOcfDV8BCeP6
	 CdOsldGxGJd9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] mfd: intel-lpss: Clean up and modernize DebugFS
 usage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
References: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 22:18:55 +0000
Message-Id: <20260915221855.DAB021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The DebugFS API is designed to handle errors gracefully.
> Any explicit checking on return values is considered an anti-pattern.
>=20
> This patch removes unnecessary error checking and converts
> intel_lpss_debugfs_add() into a void function.
>=20
> While at it, this patch also clean ups legacy and deprecated usage
> of S_IRUGO macro and debugfs_remove_recursive() function.
>=20
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-intel-lpss=
-debugfs-v5-1-99295f534067@gmail.com?part=3D1

