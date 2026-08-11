Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379203FB7EB
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438028; cv=none; b=TKTCaxonOBxvD5igoPynF18rVcRIIoYXskB7EOjkV2r71yO+3pTq/NvrSrNyGb6txP0+gm65k6y5YbDvAtqKzB+stncrLrS35la3OCwV8SVhCtWcWDZA/3wnzTzqAxx8+pQP/IGHBzfK2jF4gazV2nxB6F6qBnvwo1L2Ttk7CGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438028; c=relaxed/simple;
	bh=ETqdv5SirRPS7a+P9Awo28mb3hl7MZIcXdQy4LsTJvc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rTJ7emydtbqW52KkSj6/DjYhUwApDA610sxPJnIylL3Hj67t43pbchRJAL6eOBiF8OWa+nSoyNrvL5YDSmqQK2Ripy8hEUEoYpYFjOBH5l2LghQN4evIFPnoILFh0FGs1c5tEr4Q5XPSxN4Mr03inKYCTQ6yOFdYbmTdbix7kCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fiqbXdyI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P15u/d9h; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fiqbXdyI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P15u/d9h"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 219E37A0135;
	Tue, 11 Aug 2026 04:47:05 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 04:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786438024;
	 x=1786524424; bh=pP/RiMxk8KF/gcIudyoxIS+/C8Z1+ivY+PVmxiPxZ5g=; b=
	fiqbXdyIYnTHO72Olse4CTBd0Dfn3Gnqfo1eCzu3AVMemh+/bWVoABapb54kNW0t
	hJupokzM79Z8k9kUZMNol1J2W8+cIbIFXACeRr/Rs9Or52+pZgc8SM5IpGsLScMg
	eD5PzUGBN0v943kXXs8IgP/YqT+PbWt79IjSHrigRKv8xPlKKcKpUy926JGc5d1A
	vjsfxHE7DVfHmL2df2tE+2H5Hbh012zK5H6H6Yhq55SgERkTIbhwY3ldmFYUEOYD
	S/oG7XNqHjR2Nr4+hrAoVVDZ3uuiJGqSCCJ02Km3lN4i5p//uGDuXTKEFOrGeOuh
	tifkIBF9kJcuidIUwcFdlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786438024; x=
	1786524424; bh=pP/RiMxk8KF/gcIudyoxIS+/C8Z1+ivY+PVmxiPxZ5g=; b=P
	15u/d9hRp605tiffv6HT2B7wQmZ8p6MvixMhw0X4xWA2RQ1MBeXwTaZ0St+kD7yD
	aq1CpdPH5W8Wg0HIvcBijNzVMdkEohjXrnnB/U+lvF02N5hS4cDoXricbkn/uf5g
	d3i3K61mFaYR6e39K5349aiASx1DzaZE7SnETNAmlb6F8dBQiSmMBFLmInUCtnx9
	+vsT9bIq0EGcRxAgGcp4RJuMFZTM+Z1+vTo3hOS1skNZYBrosNKf22lw2/Yja2ZJ
	hChkqt0UwBKXWP/9fBaQKEOOZXb2CFvDoLP+8uG98QFZWXN3+JGIG6sGT8ikpteN
	/WPgkostEbkR178ilk4Kw==
X-ME-Sender: <xms:hOF6amggR3ExOGiGHYpaAa7jhVKtTHOdFp8JgmtSQ9VQiV9NQWfujA>
    <xme:hOF6ah0Q1Q2TU71qxaBYmumX8Q1iIFrR2EybICuzkZ-49PT31HA_eKl6RJOB1Lplj
    7xSG9rdTQdTjLEpxM5rB5s-qpWLOClySyckAwU6SlBM3MJb2zGAyQY>
X-ME-Proxy-Cause: dmFkZTEDXKvgTN7jzp6cp9DjOF3uA4uv/UyUgCf2sjWocYBE87U/vMU6GV50gpZfbcmXrC
    3vBZ8hZ+fBuSO/s9ddIUZr4h6K4zUwsvO4bhNoIuaTzbjLd3+zAH+SXko7Vh6f3uD7f8fX
    pev9iMRfwOsaT9gtoTyz4fu5Yl0KbRQkjBq1Ruu6ykRNUgJlyjv2OyopOKk5fAhk+vjuC+
    mmjNqvsRe+4FvYRKnut8s3wXMKMoZzyT0+xQye9VzsmEhT5cTinpim1TeyI0LiEiUqseIs
    Fvv2A7MRb6YCyMB+D+zRa1B7iJdePubdOD60d5K1y/fEEZii2EDx+sj+yC39bqUq8vSDAn
    r6C/yTAGf7BeHjzlm1CwetBKUBYA1yb9o9uXBPqOb7AOjf9n/fv7OqhkcbgDcv0kBQM01S
    FSGF4ndTNl9Q/srKPyjLGoiFXXhJTUBCH/p5s3QkqjkWUyBzmF3Dn5i0rSkz246zfpNmGj
    V173d0DrdQgj9y82zeCC0ACUaNptAEzvyBZtZyIVvEj37aV0iB9HrzCynbaa/8R8w20ruO
    1pJDBcm4f6u9HMahZ3WiLw2+y4/MAw2gayK9UycF8nFNADQaoivXJWSqw7VW01HV3PaRs1
    BG+1ZRP3Dx6CEmCXEUigJWDSp3LMrjONhbtwHtjy7Cu4HfeXXqDiMtscPBAg
X-ME-Proxy: <xmx:huF6ahTcP--G-3-AXXd0hPzslhoi5UpT3NVENarbbVlqMIu5E3K3iQ>
    <xmx:huF6atWMDqsePgKyJaTKfjfF-6gxkrE6Pm1BEe16p1q7cIy1HZxUIA>
    <xmx:huF6aqcpM_nOjyoxkuwYMUVJBojC2OAcN0VND0AijnNYhG-RdIXiyQ>
    <xmx:huF6apJ7tVfQ9xmaJp-DEZWgYKTAx6SLU05JJ9TQF9XMSg6Z0kR7_w>
    <xmx:iOF6atMBSwNrvSUL_GK8PPA-BttabuJkBskEcvuGmxyOujfP8DsvxR1->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 86E5C32A006A; Tue, 11 Aug 2026 04:47:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A9r4Xi2IO-i7
Date: Tue, 11 Aug 2026 10:46:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "James Hilliard" <james.hilliard1@gmail.com>,
 "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <159b4ed3-3718-4563-badd-3627bc51a41b@app.fastmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v6-2-c5b1292c8498@gmail.com>
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
 <20260811-submit-ac200-mfd-v6-2-c5b1292c8498@gmail.com>
Subject: Re: [PATCH v6 2/3] mfd: syscon: Add managed registration for external regmaps
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Aug 11, 2026, at 10:27, James Hilliard wrote:
> of_syscon_register_regmap() publishes an externally owned regmap in the
> global syscon list, but provides no way for a removable driver to
> withdraw it. Registering a devm-managed regmap from such a driver would
> therefore leave a stale pointer after unbind.
>
> Factor external registration through an internal helper and add
> devm_of_syscon_register_regmap(). The managed action removes the entry
> under the syscon list lock before later devres actions release the
> regmap. Hold a device-node reference for the lifetime of every
> externally registered entry so its lookup key also remains valid.
>
> Consumers of a removable provider remain responsible for ordering
> teardown, for example with a managed device link.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Hi James,

I don't think this is the right way to do it. As far as I can tell,
the device you have here is a generic mfd that uses a regmap, which
is not the same thing we usually call a syscon.

The of_syscon_register_regmap() code path was added specifically
for chips that have a traditional syscon but depending on the
firmware may have to access this by some other means. This is
already stretching the definition of syscon. I don't think we
should take this further and allow normal device drivers like
yours to register through the syscon framework.

Since you already have a top-level mfd device here, just use
that to pass the regmap to the child devices like we do for
other mfd drivers. You can e.g. do this when populating the child
devices through platform_data, or get the pointer from the
parent drvdata.

     Arnd
