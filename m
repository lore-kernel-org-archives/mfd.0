Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803924;
	b=2FNY3mO/e5csRqkcftTN8soOXCeKC4DrrwOZs7LscGLJS7DrZgKBcIA3RaIkhRhMTwfm
	 aKY/Fe9q6t0Hfk7LXG9JB6Fv/ScNpOmzx2YkJoijp6qj1X8n6dmPWGrOaTs20aaHgA5Cr
	 U2qO0fZAwvX8zmF7twoexWUgE3aWWXe4nhTYOrwNRqFxn0hrCUK+se9vUDqiuTIBKXT4X
	 Ang+kSgOYXvX2nxpd4CLWTSoQid1x4NywGcA9Q6k7Y5P3sAvTit/cojQuCj72LDtDwqiA
	 xM/c87HW/fPep+6mTh0Y/MJ0OioUMzkQkfzoEqQpwpCNkBRBFn5/4KxaRvWN3MwgPbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803924;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G7D2cB+gep9B9W288OTOtri0k1pCmmdtB94Pu5K4GIY=;
	b=3U+HngC1/NCuROO1jiucR2u9U3F2qwPHY9XRY8fBdTK4LnNIzHKasKSfvC9nxsh7VG5E
	 EXi3uuO+g4kvu0OEuE10zA8touovr44AVXbgnSJZ+ORAb0Rv6U2azSXNjgyYtzL9gvpcd
	 jyKuWdxuJZQ/Yb6GSQKtqEkdqiE8QMwNgHlQCOaXoYbDwXNOE1VWGCF7W91zlwasPzsQn
	 KXG3VqccfoH3F2FBysz0IX2UgFNb8Kk5AGFAu04YLi9QM9rhMIRrq6U74pdBfUE+LKzFA
	 tPngq7b9QwEilzJC5oTd8y/tQKJDb4+zv4aca2/Gz4NMB0V0M/yVqyERBL8XD9J6GPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrNfJmxn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C344606A31E
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrNfJmxn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D1D1F0089A;
	Fri, 27 Nov 2026 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803923;
	bh=G7D2cB+gep9B9W288OTOtri0k1pCmmdtB94Pu5K4GIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OrNfJmxn9wVC6CvliQ7L3xBF1giULIl2GZY/fNSVbx9BB36lLEkuw0QdudhXAZRS5
	 zffOf4yPOpfOudbjvZAE+11jsn/+Ll2lotIokvg87fqdYwUDdgopT5uxtbcPwiZLdc
	 aSDIXPXBNbUlka4RscV+cx1yvYu5a3f+owbjyO5xRD2LGS7jfIeQkwDeWepvAjGrEA
	 /DKEKJle/vZdQhfITVpYG0Y7RlbWPbc1TqS5nfj9fNdOzOgfMLvyUSH99Bajjgz+Qy
	 uwvdNq+/9+ILCHFU8w0st2jJ5xTGk/pvKvi4WQ+dnKNFtpr/TylVyHkuMcJiOe6VAz
	 rdBd1uI7jJoAA==
Message-ID: <sashiko-outbox-238071@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] mfd: mxs-lradc: Pass parent IRQs to child
 drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127180709.315826-1-festevam@gmail.com>
References: <20261127180709.315826-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 18:25:23 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127180709.3158=
26-1-festevam@gmail.com
