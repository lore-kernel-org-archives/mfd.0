Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858CB34D3A9;
	Wed,  9 Sep 2026 20:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985726; cv=none; b=V3DZgrms+YCZGE1ZF/g9SV0Cr9D6tAMWehZNOquEu1U6XkfW9wyPG/nZGdmdSyIsWUZjSx2I3rSntQLUxlv/UF8cO0O4GMqUEypH18TdsLBaW2X7BjruSrkMyKYzklw5jOnTQkwtxXaE8xWcz8MF0XYLCr/DlpGdHF1a49m+zqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985726; c=relaxed/simple;
	bh=QISU5wQMrvMhMtMCIZ/TuxNbQ2q9R16Gc79aX5NAMQM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QPBB3I0kn1JQtGjTS+qKSqEdt6fcWY+8lB3t0ga/exUSy0WRuQP74yakvo5n2NxZ0GlcBDZMIwsK1BUrPw75poPvWk5aua45AZidHeGFo7rhq1YFu73qNA4BS19F5P2KBcaprfLQpYn9Xp4a6jOWHZ9cKz2G7xoWTDBrKAO1tac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsNky0FM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsNky0FM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59D81F000FF;
	Wed,  9 Sep 2026 20:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788985721;
	bh=I+kxnJhecEnYspOixEfBiX1GOqSVXXYgliBU2I5h0UY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ZsNky0FM+cnOfZcw8GPn+5KJlCxcmuhYrv3hbLyHc1SQWtqbSjENdMf9MI3OnoJjP
	 VtnHs0Cx7RRSV8rhrEH5G4taOIaRCY3xXSr//H6Qt/Prj0FXmW6KZ8J8y0DU3qQZfo
	 YRaN+4Lv0tvHcQCh9NWIaXh4rVlC5AfB+wU3GQGgaCp2YIJPumY2+9o5J8ELhfXytL
	 ctEI81TnE0xeWALmnjLvLQcIpwCs5qiTeT0H8+Eg0sZKNWlKCh4YIn9HKGuE32TUP3
	 2ovByjzZl6UtcGepPBTFaAF36zTpmFszdyqff9EsezxO9H5iDjJNRMWqvoLf/fvujI
	 0rCGcWcpOALaA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 59E75198003A;
	Wed,  9 Sep 2026 16:28:39 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 09 Sep 2026 16:28:39 -0400
X-ME-Sender: <xms:dMGhakZrAgTBnlBqFftocUXviR0J2l7Sre8N_hkU3bm99NdIDpI_vQ>
    <xme:dMGhaqNkf1UVpBqqwwAIKZGe6ZLR5887KxkWzxjdQYI3lCGrl43WgdmPSAAxnQHsP
    Uox-U9EzoXttS4S5-47rSz-rZ2uAoCXuXOQors4CntR1dH4NInHP8jwKQ>
X-ME-Proxy-Cause: dmFkZTE8Kd/+IGN7zwsPgDLBZ7Pw2HSIlU3e1eyy66uQrsX01THEP44sRyzEQVpoW8v+S7
    UUKed+8n4cu4eeFtESaBbopZLJ6LrBTdCRAync7iQXnwkzKgdYbtZFutVSF81TSkj5oLHm
    r580h0FhuAildnT6ONm+KzGew4F0SEbuCQV4nqvUhYlCrVwT9UfknvcS497JIK7cA13NaY
    9Ud5IRKSG/vIwSogDRhoQkRzAa3SDHKuqOM0bM1KH7FXh9QDZUTCQwPNYTXC9RwyKnmJDH
    V7+T/rFge4J+gL6ogMK86+6wii7xZ1h6OLfZj9KgnGZLdocmKJaNmoyXFpo/+mxxaiEdkT
    jlWHsCaLqv1TGspZZq12xA8euHVb7zvVRyb2MXaU3xRe5DtA//BGIKLrgLh+dmhrsOl0Zr
    LhWH2PfvgXrEg28p9yDwL50pLFysJbkseor7mYCo6kqWkSeWAqQTWUlbSkBwY2s5Tn9yji
    zYbo1j/RT1XLUpGjwAmSZuYwovSpvRBA32oYRPXhVGksgdotjvcV8f5mqReuuUuAW9l67w
    /etZ6hRhJ7BppXSfmCE1NW0Z51mYf/ZYPGj3MzO3OLBodhCqoMiydyYfetnuz+QZbRmWXG
    6DUPUYvLLxpKQYFcX8kN926mmi5lo/AquurTUISnXbXY9XE75EuEaMhb2KlQ
X-ME-Proxy: <xmx:d8Ghas_AlNDs4o4m4hmLeopgBHxFnbofTtd53FIHx00SNOdAX09wmA>
    <xmx:d8GhatetjFIRC8dRHihv3Rdu5cMWoC3ft1F1tCAIAUNioBHRZa6oIw>
    <xmx:d8GhagtO6IjNdv5Jht6BhK6wRORMmcDzfx-4GiJr1UkH7c_qnHCeLw>
    <xmx:d8Ghau2zRd_Qf-XFQel1Ar1hzUadP-wn0PBMyD9aurfsjithUavzxA>
    <xmx:d8GhalBJh7CQ2Q4n7PDcU-vbkiGbQPaVyavFhkAYmhgNTQLesx-lqTph>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CB1DB32A007B; Wed,  9 Sep 2026 16:28:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A6VsXwS0CIh3
Date: Wed, 09 Sep 2026 22:28:16 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 media-ci@linuxtv.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Rob Herring" <robh@kernel.org>,
 linux-input@vger.kernel.org,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Florian Fainelli" <florian@openwrt.org>, "Lee Jones" <lee@kernel.org>
Message-Id: <098645b4-afea-47db-9c43-ecd5ef61c68a@app.fastmail.com>
In-Reply-To: <20260909133956.E4DD51F00A3D@smtp.kernel.org>
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-3-arnd@kernel.org>
 <20260909133956.E4DD51F00A3D@smtp.kernel.org>
Subject: Re: [PATCH 02/14] mfd: remove unused rdc321x southbridge support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 9, 2026, at 15:39, sashiko-bot@kernel.org wrote:
>> Remove this driver, as there is no way to run Linux any more on the
>> older chips after i486 support has been removed.
>> 
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> [Severity: Low]
> Since the entire platform and driver support is being removed, should we
> also clean up the remaining dead references to the RDC321x platform?
>
> Specifically, the reboot fixup code in arch/x86/kernel/reboot_fixups_32.c
> has a rdc321x_reset() function and an associated entry in fixups_table that
> appear to be left behind now that the hardware is no longer supported.
>
> Additionally, the PCI_DEVICE_ID_RDC_R6030 definition in include/linux/pci_ids.h
> is no longer used by any active driver.

This sounds like something that should go through the x86 tree, but probably
not this patch.

> Finally, there is a stale "RDC R-321X SoC" entry in MAINTAINERS that might
> need to be removed to complete the cleanup.

Removed this now, and added Florian to Cc here and in the changelog.

     Arnd
