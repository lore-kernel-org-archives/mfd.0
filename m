Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415059;
	b=doLu0TKsVeoOfryUhQ6a9M+xfFJ+h0gexuU1Q32tZuuTNqPXgdHTdg2s3LdwA4eTiJnC
	 J2gbibH2QZHiLH7CfPNm8e2RJh3Hy4ITtbSuBtmPQg0A3W5NVcCAYhySTCvUj8KjV2B6z
	 OVJJ2/aZebYO5qL/7m7i2E9saZGam7k2T+xolA6X5cXijLIn3CjQX8Zo2H2Cr3DlgBdW1
	 5rP3g8RISVn7TuwHKejBKC9i7EY6l4ZVfjp894xRkDGi8mBSnKpnwjrNgkG6qh9evvi/4
	 EL4f+S3ZmbCXqmoMcXJPMOhOFLmtnS7k64c6Hjembqe4l0dkG5IjXNyDMBd25QHf4lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JV2UV74dkWO5TgZQL2wBeL3Mgq/3k9N3hqWRtljHlY4=;
	b=1ynQdZOMI1/f0j35wh9WTIdHN2hTUp7A99tazcsCoxAxCN3nXhAgWETxWingDPprryvR
	 nlHc+QN5f8Gr3Z+R7VsayOTkvXBCqXii5PPg629N6cZ3c4msjhp2iy15gYaDrf7zwVyqs
	 NXBvQXUlJ09qyqK5VE/BPp8a6iQC5kBLy+mrV0K98sX8L77isPXnpc5IpXtROD11yX7g5
	 ywAgv6vdC2VI4QZw4PyQtnkVjvUKinsNiGI7XA8+4waLQ3HeGPEO9cpJ5I4kRoPP4fcVY
	 ptkxpjlX94r9j8jSBtjmOVHlnzMdn2THYqJ+9sYEDj9G3M95rzVPOYhHdznmcT5t/uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNY3Grs1;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C24606A32D
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 16:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C24606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNY3Grs1
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so20828925e9.2
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415057; x=1795019857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JV2UV74dkWO5TgZQL2wBeL3Mgq/3k9N3hqWRtljHlY4=;
        b=jNY3Grs106oIzjGTfn3kSDrtg1BkcEdrg3N7IcJRYfUbNw72W/6AfrJJ/vw/V4UqrB
         pGFrRBWDn38V0FUo0ML30PsfF9dBV+m7LmtjBXcKoVZI0a3an5r4EhG9Kw3VwLDGaZLj
         ICzX7IZNxaY2t19Ubvkd5ghx1GoVaYf3b0+84rizy9VSSx3kblWlA5yXCiAgkAWjAkVf
         ZEYVnTr1I4rJ9ukyn3ViHPLLD5WLjfJ8jJ6zcZby+dMORmVGpjbz2RbZcbNYCAdU7y54
         /D5cKhs8lE83/ttsTJJzOPRO1EJyo/e1iR02/verVKXWc/Sg+srz7fDVBkOmz5KoXuEF
         wC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415057; x=1795019857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JV2UV74dkWO5TgZQL2wBeL3Mgq/3k9N3hqWRtljHlY4=;
        b=TfwvrUf+E3PmUR5ldiH1ECAxFx4Ac3X12S0iia7TcwmE9sDQKJCqsLs0rdcSy2GeCN
         9yDUhw6mthzWvnvKiViU3O96Y5E6rvWTrIFig7BVyu2jQ4Eee5Iz8tB2kRtw3c7aRhPc
         A3CEWaE0EeEcDxEHXEGfeJ6YkJuOw+dTIryhHvyT3+zNOP+z6W4N2kZvWPMF33IPbQdD
         YHxVJG4Yakl7rCs6aytYGz4EjKCbrGYA1fLBkG3dyV/m9n0GsfcNX0+LCsBjFLV+qpAi
         Xxq6TGwxqPmFvnwR+KJQxu6wP1Iuud+OPFa3hPqpkRuawznnzuxPpm2IKAS7yzC4ZNmz
         hFwA==
X-Forwarded-Encrypted: i=1; AL+hErFnLIxkLOcGwOwvdlmhWTTqg2Ndcy7l9ptc9eqJ758/hMaC6yh7LJcTSO1OC7z1gPLe5PY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8HSMYTzuzxjdgX0/iuZ2+stQLgMayATWCivkfO5p1FFZWT+Q9p
	04YzESwTdh7cZXfe8su6Bfav8S8xl4/7g3YFhwyjoY4xpRGrOfQxGhug
X-Gm-Gg: AYBFou2xgvfFUerIM9ZaDvBWanbH8qEtoABAoWPPoifhJ91rxttRclItqWPicbqWR+q
	aJPr/++vvHL+7R/c1XEvohkE3D+Q0uWEodsirM7Z6IEhhtfINfCfmZqSW64H9zlo+3IdDsnqBC9
	YQUTGwAYNbCgwfFjYxhyrmpT5Ogyus04CWu9txYonDj9GEQ/YBCPDtUeF4aL4njDJxPQruSYQPy
	kg3FHgJiU1EwFSB6N4eOS96TGKN0rufJ1yK2u15hyYKJC3qTKB+zp5QJR2YU/ZRolEXmM5FaPq9
	fxms3RpDVH8dBkqc0odS3hYSPBcPezkPDEBTyMgRpwRM3xRzBrtPIdj9eeo4TgcGyT0AvzoCtQh
	WFOAM9eUjfKPUvyd63vG/N/zpE70LdUpNRrH4U3UlRBkQm4usr2rR29Dg9jCLWOcqH4yzRee4hs
	MvJZYZ53z1wWjHTjVE2K5Em/h9A/vF9R4A3j4QRw0jYAaOlPGwzNAH3orjcd/o2aKr8SjYU9eIe
	9kpMS+u/2J4rXTogvIDxgsubUwY/aZvJXOLbHu0RH/s1m30ipcUuKccuO5NN7e0Sj0XE/WHvwhi
	sfoXWqXLX3tdS411BIJj4i2FtFYur19pJ0XJHvAeV9SIdoR0lGLAmpbEQg4pLWjv8TGDUij6EPK
	GsiXJIWLKD1Tb8YW3AmsocFgQEU5mA0cCyrc=
X-Received: by 2002:a05:600c:3b01:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4ba09344911mr53668455e9.1.1794415056383;
        Wed, 11 Nov 2026 08:37:36 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c377fdsm9925377f8f.21.2026.11.11.08.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:35 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/7] zorro: add a CS-Lab Warp 1260 MFD
Date: Wed, 11 Nov 2026 17:37:27 +0100
Message-ID: <20261111163735.227286-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CS-Lab Warp 1260 is an A1200 trapdoor multifunction accelerator: it
contains a 68060, an FPGA, an ARM co-processor and several sub-devices
hanging off them. The 68k drives the IDE interface and the RTG display
controller directly, through the FPGA; the ARM owns most of the rest -
USB, SD card, WiFi, audio, the Kickstart slots, the CPU clock, fan
control and the board telemetry - and the 68k reaches it through a
dual-port RAM mailbox.

pata_cswarp, merged in 7.4-rc1, binds the board's Zorro device for the
IDE window alone. This series puts an mfd parent on the device
instead, hands the IDE window to pata_cswarp as a cell, and uses the
mailbox for a first set of board functions, exposed as sysfs
attributes on the Zorro device:

  1-3  the mfd parent, pata_cswarp as its first cell, defconfig
  4    the dual-port RAM command channel and the board identity
  5-7  voltages and temperatures, fan duty cycle, Kickstart slot
       selection

The layout - an mfd parent in drivers/zorro/ handing cells to the
function drivers - is modelled on Geert's Zorro MFD experiments [1],
which were the inspiration for this series.

The RFC [2] got no replies, so its questions still stand:

- Geert, does this fit where you wanted to take the Zorro MFD work?
  Should the parent stay in drivers/zorro/, as in your experiments,
  or move to drivers/mfd/? Lee, I have Cc'd you for this one.
- Would you rather see the voltages, temperatures and fan in hwmon
  than as plain sysfs attributes?
- Writing kickslot makes the ARM reset the machine on the spot. Is a
  sysfs attribute acceptable for that?

Changes since the RFC:
- Rebased on v7.4-rc2, which has pata_cswarp and its defconfig patch.
- Dropped the WiFi configuration patch. The board commits the SSID and
  the passphrase together when the passphrase arrives, so writing the
  passphrase alone clears the SSID: two independent attributes cannot
  express that.
- Documented the attributes in
  Documentation/ABI/testing/sysfs-driver-warp-mfd and added a
  MAINTAINERS entry.
- Created the attributes through .driver.dev_groups.
- pata_cswarp: mapped the cell with devm_ioremap_resource().
- The store callback takes a size_t count, the driver includes what it
  uses, and the probe banner prints the board window with %pR.

Tested on a Warp 1260 (firmware 20.27) on top of v7.4-rc2. Every patch
builds warp-mfd and pata_cswarp with W=1 for m68k.

I wrote the original version of this driver myself, by hand. An LLM
coding assistant came in later: it was used to review that code
against CS-Lab's AmigaOS sources, to write several of the fixes folded
into these patches and the ABI documentation, to split the work into
this series and to draft the commit messages. I reviewed every change
and tested the result on my Warp 1260.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd
[2] https://lore.kernel.org/r/20261021172910.134838-1-p.pisati@gmail.com

Paolo Pisati (7):
  zorro: warp mfd: add the CS-Lab Warp multifunction parent
  ata: pata_cswarp: bind to the Warp mfd cell instead of the Zorro
    device
  m68k: defconfig: enable WARP_MFD
  zorro: warp mfd: add the dual-port RAM command channel and expose the
    board identity
  zorro: warp mfd: expose the voltage and temperature sensors
  zorro: warp mfd: expose the fan duty cycle
  zorro: warp mfd: expose the Kickstart slot selection

 .../ABI/testing/sysfs-driver-warp-mfd         |  53 ++
 MAINTAINERS                                   |   8 +
 arch/m68k/configs/amiga_defconfig             |   1 +
 arch/m68k/configs/multi_defconfig             |   1 +
 drivers/ata/Kconfig                           |   2 +-
 drivers/ata/pata_cswarp.c                     |  48 +-
 drivers/zorro/Kconfig                         |  30 ++
 drivers/zorro/Makefile                        |   2 +
 drivers/zorro/warp-mfd.c                      | 473 ++++++++++++++++++
 drivers/zorro/warp-mfd.h                      | 148 ++++++
 10 files changed, 734 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-warp-mfd
 create mode 100644 drivers/zorro/warp-mfd.c
 create mode 100644 drivers/zorro/warp-mfd.h


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

