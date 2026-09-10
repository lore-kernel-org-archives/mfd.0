Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE44B4A2A4C
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047051; cv=none; b=YXt+uv6vWxOUFxb+KOJxJE3MEpCSS8gVtR4e6DnMlvmXqbAIBEAoSjdqSzx+MmDhZC5lwiKgxGeoPFd8wHL+bjjfYNF8UlfoZpDUE0H3nS5K0FqjB3JUzxt1ErhPVSOoMtVGigY/vPLtGgBJ6klYfDxzz2mvhgxiRGPkWAQVPmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047051; c=relaxed/simple;
	bh=Fpx/sm2DrcpPH/Toa0gFsA+QSuhb0yubc11pjRrTCVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QYgwPSdPz1R9G8CL8rMWN8k5+RVkycZ4PR2ESv89ndeLaTmXCiaDqwKuMwSqZcFtCKvm2T46iym/ouXk8Hk8W4AnpyyL62vMNisZ91cBGrZgD1lii0uPjFbIQYBSlippnbx6mgt2MMfRcyyZSEN4muQp9l2GLfX9JaAz/ZDlwA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJqSByUT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJqSByUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3C81F00899;
	Thu, 10 Sep 2026 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047049;
	bh=JGKsPstcjOXIkQk7vNRy4hBgl7GruBXgBQB+LJlxMqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HJqSByUTJRRKKJQWqG4f/LOnEKUIFEhFBN+fezJXX4DQ9x3ZFBHWADx1whTvl0bEQ
	 czPGyJDoru7KB5eEOBOzEQ3a71UdqEePz0MmwJ+oKdE6IB6w+6ZbfF8EfRixKwIkQx
	 JC6+a82F4hjZHGTCX89E1lbu8R+FV1SIGH8pQ7jzb8t59/QXyzWYf5f7xjpt2BEgJz
	 OPc9OruDnCEkm13eBLiTbRa+9/OKAm2rw5ZdP83c2TpvG8dKmNGS32hZCGnDznsVKY
	 uRCoqXw0MVtIAbLMXZJ119I1HOgmAIkLMeqp/5yMSVl0cqqgWTEZENCE1Uvhriyuxp
	 UB2CqpUl9rGrA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Triet Hoang <triet.hoang.dev@gmail.com>
Cc: mfd@lists.linux.dev
In-Reply-To: <20260829050228.42638-1-triet.hoang.dev@gmail.com>
References: <20260829050228.42638-1-triet.hoang.dev@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <178904704849.1147160.7408755585698262891.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:30:48 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 29 Aug 2026 12:02:28 +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
> and pm_sleep_ptr().
> 
> This allows us to drop the __maybe_unused annotations from PM callbacks.
> This is a straightforward cleanup with no functional change intended.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      commit: 25d865396625ba1a4e85d09fd850ec93a93ffd10

--
Lee Jones [李琼斯]

